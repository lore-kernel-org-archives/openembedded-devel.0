Received: from 2.mo68.mail-out.ovh.net (2.mo68.mail-out.ovh.net [46.105.52.162])
 by mx.groups.io with SMTP id smtpd.web12.1191.1606333075145347512
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2020 11:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 46.105.52.162, mailfrom: maciej.pijanowski@3mdeb.com)
Received: from player688.ha.ovh.net (unknown [10.108.57.72])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id E77AE17F1E6
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2020 20:37:52 +0100 (CET)
Received: from 3mdeb.com (89-66-159-90.dynamic.chello.pl [89.66.159.90])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player688.ha.ovh.net (Postfix) with ESMTPSA id 559211872E534
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2020 19:37:52 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-101G0049c8ce3c2-ea83-4136-9c9a-f48ae22d1c64,
                    75A271BDE3F50F31F0097557F71BA253F37127E0) smtp.auth=maciej.pijanowski@3mdeb.com
Subject: Re: [oe] [meta-oe][PATCH v3] cdrkit: split into more packages
To: openembedded-devel@lists.openembedded.org
References: <88102> <164AD754962057B1.8857@lists.openembedded.org>
From: "Maciej Pijanowski" <maciej.pijanowski@3mdeb.com>
Message-ID: <d3734284-1b8a-c1a6-de96-34bf36ef63c4@3mdeb.com>
Date: Wed, 25 Nov 2020 20:37:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <164AD754962057B1.8857@lists.openembedded.org>
X-Ovh-Tracer-Id: 12866784137539890760
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudehtddguddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepuffvfhfhkffffgggjggtsegrtderredtfeejnecuhfhrohhmpeforggtihgvjhcurfhijhgrnhhofihskhhiuceomhgrtghivghjrdhpihhjrghnohifshhkihesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnheptefgheeihfejleekkeetteehtdegieefvdeggeejteevkeetffduteefgeeuteeknecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpfehmuggvsgdrtghomhenucfkpheptddrtddrtddrtddpkeelrdeiiedrudehledrledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieekkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehmrggtihgvjhdrphhijhgrnhhofihskhhiseefmhguvggsrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
Content-Type: multipart/alternative;
 boundary="------------1F5DB11E93955A22953D8907"
Content-Language: en-US

--------------1F5DB11E93955A22953D8907
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


On 25.11.2020 20:36, Maciej Pijanowski wrote:
> Mimic the Debian pacaking scheme to allow for more fine-grained
> installation choice (install the binaries we need). Moreover, dirsplit
> was moved to a separate package, as it pulls in perl interpreter.
>
> Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> ---
>  .../packagegroups/packagegroup-meta-oe.bb     |  4 +++
>  .../cdrkit/cdrkit_1.1.11.bb                   | 32 ++++++++++++++++++-
>  2 files changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index ccbd01aaf006..8c6d50ca1f63 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -616,6 +616,10 @@ RDEPENDS_packagegroup-meta-oe-multimedia ="\
>      alsa-oss \
>      ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "faad2", "", d)} \
>      cdrkit \
Wait, I need to remove the cdrkit, will resend once again... sorry
> +    dirsplit \
> +    genisoimage \
> +    icedax \
> +    wodim \
>      id3lib \
>      audiofile \
>      a2jmidid \
> diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
> index 1c7f4c62e5f4..3344821fa0da 100644
> --- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
> +++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
> @@ -18,7 +18,37 @@ SRC_URI[sha256sum] = "d1c030756ecc182defee9fe885638c1785d35a2c2a297b4604c0e0dcc7
>  inherit cmake
>  
>  DEPENDS = "libcap file bzip2"
> -RDEPENDS_${PN} = "perl"
> +RDEPENDS_dirsplit = "perl"
> +
> +PACKAGES =+ "dirsplit genisoimage icedax wodim"
> +
> +FILES_dirsplit = " \
> +    ${bindir}/dirsplit \
> +"
> +
> +FILES_genisoimage = " \
> +    ${bindir}/devdump \
> +    ${bindir}/genisoimage \
> +    ${bindir}/isodebug \
> +    ${bindir}/isodump \
> +    ${bindir}/isoinfo \
> +    ${bindir}/isovfy \
> +    ${bindir}/mkisofs \
> +"
> +
> +FILES_icedax = " \
> +    ${bindir}/cdda2mp3 \
> +    ${bindir}/cdda2ogg \
> +    ${bindir}/icedax \
> +    ${bindir}/pitchplay \
> +    ${bindir}/readmult \
> +"
> +
> +FILES_wodim = " \
> +    ${bindir}/readom \
> +    ${bindir}/wodim \
> +    ${sbindir}/netscsid \
> +"
>  
>  do_install_append() {
>      ln -sf ${bindir}/genisoimage ${D}${bindir}/mkisofs
>
> 
>
-- 
Maciej Pijanowski
Embedded Firmware Team Leader
GPG: 9963C36AAC3B2B46
https://3mdeb.com | @3mdeb_com


--------------1F5DB11E93955A22953D8907
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 25.11.2020 20:36, Maciej Pijanowski
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:164AD754962057B1.8857@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">Mimic the Debian pacaking scheme to allow for more fine-grained
installation choice (install the binaries we need). Moreover, dirsplit
was moved to a separate package, as it pulls in perl interpreter.

Signed-off-by: Maciej Pijanowski <a class="moz-txt-link-rfc2396E" href="mailto:maciej.pijanowski@3mdeb.com">&lt;maciej.pijanowski@3mdeb.com&gt;</a>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  4 +++
 .../cdrkit/cdrkit_1.1.11.bb                   | 32 ++++++++++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index ccbd01aaf006..8c6d50ca1f63 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -616,6 +616,10 @@ RDEPENDS_packagegroup-meta-oe-multimedia ="\
     alsa-oss \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "faad2", "", d)} \
     cdrkit \</pre>
    </blockquote>
    Wait, I need to remove the cdrkit, will resend once again... sorry<br>
    <blockquote type="cite"
      cite="mid:164AD754962057B1.8857@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">
+    dirsplit \
+    genisoimage \
+    icedax \
+    wodim \
     id3lib \
     audiofile \
     a2jmidid \
diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
index 1c7f4c62e5f4..3344821fa0da 100644
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
@@ -18,7 +18,37 @@ SRC_URI[sha256sum] = "d1c030756ecc182defee9fe885638c1785d35a2c2a297b4604c0e0dcc7
 inherit cmake
 
 DEPENDS = "libcap file bzip2"
-RDEPENDS_${PN} = "perl"
+RDEPENDS_dirsplit = "perl"
+
+PACKAGES =+ "dirsplit genisoimage icedax wodim"
+
+FILES_dirsplit = " \
+    ${bindir}/dirsplit \
+"
+
+FILES_genisoimage = " \
+    ${bindir}/devdump \
+    ${bindir}/genisoimage \
+    ${bindir}/isodebug \
+    ${bindir}/isodump \
+    ${bindir}/isoinfo \
+    ${bindir}/isovfy \
+    ${bindir}/mkisofs \
+"
+
+FILES_icedax = " \
+    ${bindir}/cdda2mp3 \
+    ${bindir}/cdda2ogg \
+    ${bindir}/icedax \
+    ${bindir}/pitchplay \
+    ${bindir}/readmult \
+"
+
+FILES_wodim = " \
+    ${bindir}/readom \
+    ${bindir}/wodim \
+    ${sbindir}/netscsid \
+"
 
 do_install_append() {
     ln -sf ${bindir}/genisoimage ${D}${bindir}/mkisofs
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Maciej Pijanowski
Embedded Firmware Team Leader
GPG: 9963C36AAC3B2B46
<a class="moz-txt-link-freetext" href="https://3mdeb.com">https://3mdeb.com</a> | @3mdeb_com</pre>
  </body>
</html>

--------------1F5DB11E93955A22953D8907--
