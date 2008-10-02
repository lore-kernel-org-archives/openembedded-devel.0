Received: from [66.7.219.172] (helo=hostdime.freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1KlX4M-00031x-C0
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Oct 2008 00:54:50 +0200
Received: from freedom.ind.br (unknown [10.99.0.10])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id 4E6093343A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Oct 2008 19:50:32 -0300 (BRT)
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 03F798C5B8D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Oct 2008 19:50:35 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id AA4138C5B85
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Oct 2008 19:50:34 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 2 Oct 2008 19:50:34 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 047FCC2B1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Oct 2008 19:50:44 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 7C431610186; Thu,  2 Oct 2008 19:48:04 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <87myhocttc.fsf@neumann.lab.ossystems.com.br>
	<gc2vid$bro$1@ger.gmane.org>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Thu, 02 Oct 2008 19:48:04 -0300
In-Reply-To: <gc2vid$bro$1@ger.gmane.org> (Koen Kooi's message of "Thu\,
	02 Oct 2008 19\:14\:53 +0200")
Message-ID: <87k5cqwr4r.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Subject: Re: firefox 3.0.1 issues
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
X-List-Received-Date: Thu, 02 Oct 2008 22:54:50 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

> On 01-10-2008 15:45, Otavio Salvador wrote:
>> Hello,
>>
>> I've found few issues with Firefox 3.0.1. Those are:
>>
>>   - lack of theme icons (arrows and like)
>
> Actually, what I assumed to be some new-fangled GUI is a case of
> missing icons[1]. So, yes, every OE built FF3 is missing those icons.

Exactly. Talking to Kalev Lember at #oe he suggested few changes to
mozconfig he has using and those did fix this problem here. Dunno
which one is the real fix...

diff --git a/packages/mozilla/firefox-3.0.1/mozconfig b/packages/mozilla/firefox-3.0.1/mozconfig
index cd09716..06295ad 100644
--- a/packages/mozilla/firefox-3.0.1/mozconfig
+++ b/packages/mozilla/firefox-3.0.1/mozconfig
@@ -23,6 +23,7 @@ ac_add_options --disable-ldap
 ac_add_options --disable-mathml
 ac_add_options --disable-jsd
 ac_add_options --disable-installer
+ac_add_options --disable-updater
 ac_add_options --disable-xprint
 ac_add_options --disable-necko-disk-cache
 
@@ -32,12 +33,14 @@ ac_add_options --enable-necko-small-buffers
 # disable debug logging and tests
 #ac_add_options --disable-dtd-debug
 ac_add_options --disable-logging
+ac_add_options --disable-debug
 ac_add_options --disable-gtktest
 ac_add_options --disable-tests
-ac_add_options --disable-printing
+#ac_add_options --disable-printing
 ac_add_options --disable-gnomevfs
 ac_add_options --disable-gnomeui
-ac_add_options --enable-debugger-info-modules
+#ac_add_options --enable-debugger-info-modules
+ac_add_options --disable-crashreporter
 
 # build crypto module (PSM + NSS)
 ac_add_options --enable-crypto
@@ -46,7 +49,7 @@ ac_add_options --enable-crypto
 ac_add_options --enable-necko-protocols=http,file,res,ftp,about,viewsource
 
 # build minimal set of image decoders
-ac_add_options --enable-image-decoders=png,gif,jpeg
+#ac_add_options --enable-image-decoders=png,gif,jpeg
 
 #ac_add_options --enable-reorder
 #ac_add_options --enable-elf-dynstr-gc
@@ -54,7 +57,7 @@ ac_add_options --enable-image-decoders=png,gif,jpeg
 # enable static build
 #ac_add_options --disable-shared
 #ac_add_options --enable-static
-ac_add_options --enable-optimize=-O2
+#ac_add_options --enable-optimize=-O2
 
 # Use cairo from system
 ac_add_options --enable-system-cairo


-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


