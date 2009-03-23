Received: from [208.51.207.131] (helo=mail.2mi.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jader@2mi.com.br>) id 1LlpZZ-0007xf-Ps
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Mar 2009 20:12:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.2mi.com.br (Postfix) with ESMTP id 2A6F6502762C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2009 16:16:53 -0300 (BRT)
X-Virus-Scanned: amavisd-new at 2mi.com.br
Received: from mail.2mi.com.br ([127.0.0.1])
	by localhost (mail.2mi.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YluXfbCnufqD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2009 16:16:48 -0300 (BRT)
Received: from [192.168.15.108] (unknown [189.102.205.109])
	by mail.2mi.com.br (Postfix) with ESMTP id B6DBB5026716
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2009 16:16:46 -0300 (BRT)
From: "Jader H. Silva" <jader@2mi.com.br>
To: OpenEmbedded Dev List <openembedded-devel@lists.openembedded.org>
Organization: 2MI Tecnologia
Date: Mon, 23 Mar 2009 16:10:54 -0300
Message-Id: <1237835454.6521.9.camel@northpole>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: libxml2-native build against host zlib.h
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
X-List-Received-Date: Mon, 23 Mar 2009 19:12:38 -0000
X-Groupsio-MsgNum: 8639
Content-Type: multipart/mixed; boundary="=-i8HquWuaLq0Ud/dg+Ddq"

--=-i8HquWuaLq0Ud/dg+Ddq
Content-Type: multipart/related; type="multipart/alternative"; boundary="=-j0DSAkIWHvOLmyKM7fq4"

--=-j0DSAkIWHvOLmyKM7fq4
Content-Type: multipart/alternative; boundary="=-4gz+7kPncfZYcjnj+wA5"

--=-4gz+7kPncfZYcjnj+wA5
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

It seems libxml2-native is built using host zlib.h.
My host have a symbol redefinition in zlib.h (gzopen -> gzopen64), but
that symbol does not exists in OE compiled library.
Setting --with-zlib=${STAGING_INCIR}/zlib.h in libxml2-native.inc solved
it. There's a patch attached.

Att.


Jader H. Silva
jader@2mi.com.br
Depto. de desenvolvimento
2MI Tecnologia





   It seems libxml2-native is built using host zlib.h.
   My host have a symbol redefinition in zlib.h (gzopen -> gzopen64), but
   that symbol does not exists in OE compiled library.
   Setting --with-zlib=${STAGING_INCIR}/zlib.h in libxml2-native.inc
   solved it. There's a patch attached.

      Att.

   [cid:1237835158.6521.3.camel@northpole] Jader H. Silva
                                           [1]jader@2mi.com.br
                                           Depto. de desenvolvimento
                                           2MI Tecnologia

References

   1. mailto:jader@2mi.com.br

--=-4gz+7kPncfZYcjnj+wA5--

--=-j0DSAkIWHvOLmyKM7fq4
Content-ID: <1237835158.6521.3.camel@northpole>
Content-Disposition: attachment; filename=".rodape.png"
Content-Type: image/png; name=".rodape.png"
Content-Transfer-Encoding: base64

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

--=-j0DSAkIWHvOLmyKM7fq4--

--=-i8HquWuaLq0Ud/dg+Ddq
Content-Disposition: attachment; filename="libxml2-native.inc.patch"
Content-Type: text/x-patch; name="libxml2-native.inc.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

diff --git a/recipes/libxml/libxml2-native.inc b/recipes/libxml/libxml2-native.inc
index b819f95..c9c5092 100644
--- a/recipes/libxml/libxml2-native.inc
+++ b/recipes/libxml/libxml2-native.inc
@@ -14,6 +14,7 @@ EXTRA_OECONF = "\
   --with-catalog \
   --without-docbook \
   --with-c14n \
+  --with-zlib=${STAGING_INCDIR}/zlib.h \ 
 "
 
 do_stage () {


--=-i8HquWuaLq0Ud/dg+Ddq--
