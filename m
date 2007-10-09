Received: from [64.233.182.186] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1IfIPu-0001Sg-Rn
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2007 18:58:46 +0200
Received: by nf-out-0910.google.com with SMTP id h3so1236875nfh
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2007 09:52:58 -0700 (PDT)
Received: by 10.86.72.15 with SMTP id u15mr6147861fga.1191948778218;
	Tue, 09 Oct 2007 09:52:58 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.99.2])
	by mx.google.com with ESMTPS id 28sm8695215fkx.2007.10.09.09.52.57
	(version=SSLv3 cipher=OTHER); Tue, 09 Oct 2007 09:52:57 -0700 (PDT)
Date: Tue, 9 Oct 2007 19:52:55 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <153769710.20071009195255@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1191926182.20582.22.camel@localhost.localdomain>
References: <1191494488.2516.34.camel@toontown>
	<B9AD73C2-790F-43EE-9FC4-96F1B1FA9415@selfish.org>
	<1191502502.2516.39.camel@toontown>
	<EB5E2840-5F10-45F9-8B97-9FCFDC7F5AAE@selfish.org>
	<D61182AC8012EA4EBC531B3AF23BE10947F630@tranzeo-mail2.12stewart.tranzeo.com>
	<4704F01B.70104@klever.net> <4705D99D.6070209@miromico.ch>
	<f96d234e0710050657lbbf7391tb2437588f9c93d31@mail.gmail.com>
	<f96d234e0710081320s567bf1bfie56eebca83afb6b2@mail.gmail.com>
	<1191918523.470b3bbb10a47@dominion.kabel.utwente.nl>
	<74d0deb30710090202i61cdd25n22f3519ebfd9147a@mail.gmail.com>
	<1191926182.20582.22.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: oe for two target boards at the same time
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Oct 2007 16:58:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

Tuesday, October 9, 2007, 1:36:22 PM, you wrote:

> On Tue, 2007-10-09 at 11:02 +0200, pHilipp Zabel wrote:
>> On 10/9/07, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> > If you already built binutils you can remove MACHINE=<foo> from conf files and
>> > set it in env, e.g. :
>> >
>> > MACHINE=c7x0 bitbake mono ; MACHINE=fic-gta01 bitbake mono
>> >
>> > that saves you a complete reparse.
>> 
>> Isn't the binutils MACHINE environment variable issue fixed by now?
>> I only just noticed that I don't know because I have MACHINE?=magician
>> somewhere and always seem to do the first build without the MACHINE
>> envvar set...

> The issue should be fixed. I regularly make builds with a MACHINE ?=
> entry but with MACHINE set in the environment too and it all seems to
> work.

> People keep telling me there is a problem but I've not seen any
> reproducible test case...

  Thanks for bringing this up. Not yet, not yet. Following patch was
produced to fix another manifestation of the issue, hopefully forever:

Index: lib/bb/data.py
===================================================================
--- lib/bb/data.py      (revision 974)
+++ lib/bb/data.py      (working copy)
@@ -370,18 +370,19 @@
     if type(val) is not types.StringType:
         return 0
 
-    if getVarFlag(var, 'matchesenv', d):
-        return 0
-
     if (var.find("-") != -1 or var.find(".") != -1 or var.find('{') != -1 or var.find('}') != -1 or var.find('+') != -1) and not all:
         return 0
 
     varExpanded = expand(var, d)
 
+    # Unexporting is the highest priority
     if unexport:
         o.write('unset %s\n' % varExpanded)
         return 1
 
+    if getVarFlag(var, 'matchesenv', d):
+        return 0
+
     val.rstrip()
     if not val:
         return 0


  The idea is simple: if a var is marked as unexported, then it should
be unset unconditionally regardless of any other circumstances ;-).

  So, I hit this issue on a RedHat-based system (FC5). Otherwise, it
seemed to have worked on Debian/Gentoo systems.

> Cheers,

> Richard


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



