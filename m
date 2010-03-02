Received: from mail-pz0-f175.google.com ([209.85.222.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1Nmaq7-0007ae-TY
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 23:45:20 +0100
Received: by pzk5 with SMTP id 5so512957pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Mar 2010 14:42:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.142.248.12 with SMTP id v12mr3818225wfh.343.1267569744326; 
	Tue, 02 Mar 2010 14:42:24 -0800 (PST)
In-Reply-To: <hm05ln$2cr$1@dough.gmane.org>
References: <18e217241002221429m1939c786u52da4672f626ca07@mail.gmail.com>
	<hm05ln$2cr$1@dough.gmane.org>
Date: Tue, 2 Mar 2010 14:42:24 -0800
Message-ID: <18e217241003021442w4a181b27wf9007458c97f4765@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.175
X-SA-Exim-Mail-From: msundius@sundius.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: using initramfs with openembedded.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Mar 2010 22:45:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 23, 2010 at 1:03 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 22-02-10 23:29, C Michael Sundius wrote:
> > We'd like to put our initial boottime file system into the initramfs in
> the
> > kernel. But we also need to build some separate drivers to put into that
> > filesystem image.
> >
>
> The common way right now is to use 2 kernel recipes. Not an optimal
> situation, but it will get you there.
>
> Back to this question, using two kernel recipes would create two machine
specific directories under tmp/work/

tmp/work/boot-kenrel/(kernel and modues)
tmp/work/run-time-kenrel/(kernel and modules)

so we'd still have to build all the modules twice too... is that right? I
guess we'd install the boot-modules into the initramfs, and throw away that
kernel.

then we'd link the initramfs into the runtime kenrel.

finally we'd install the runtime modules into the runtime filesystem....

