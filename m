Received: from [208.51.207.131] (helo=mail.2mi.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jader@2mi.com.br>) id 1LrFYO-00077p-AM
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 19:57:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.2mi.com.br (Postfix) with ESMTP id 28D125010903
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Apr 2009 15:01:58 -0300 (BRT)
X-Virus-Scanned: amavisd-new at 2mi.com.br
Received: from mail.2mi.com.br ([127.0.0.1])
	by localhost (mail.2mi.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A7uEcqVgdiQJ
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Apr 2009 15:01:53 -0300 (BRT)
Received: from [192.168.15.105] (unknown [189.102.204.146])
	by mail.2mi.com.br (Postfix) with ESMTP id E350B50277F0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Apr 2009 15:01:52 -0300 (BRT)
Message-ID: <49DB935B.3000907@2mi.com.br>
Date: Tue, 07 Apr 2009 14:54:35 -0300
From: "Jader H. Silva" <jader@2mi.com.br>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1237835454.6521.9.camel@northpole> <grg0jf$sem$1@ger.gmane.org>
In-Reply-To: <grg0jf$sem$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 208.51.207.131
X-SA-Exim-Mail-From: jader@2mi.com.br
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libxml2-native build against host zlib.h
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
X-List-Received-Date: Tue, 07 Apr 2009 17:58:06 -0000
Content-Type: multipart/mixed; boundary="------------050601070201090009010700"

--------------050601070201090009010700
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi escreveu:
> On 23-03-09 20:10, Jader H. Silva wrote:
>>     It seems libxml2-native is built using host zlib.h.
>>     My host have a symbol redefinition in zlib.h (gzopen ->  
>> gzopen64), but
>>     that symbol does not exists in OE compiled library.
>>     Setting --with-zlib=${STAGING_INCIR}/zlib.h in libxml2-native.inc
>>     solved it. There's a patch attached.
>
> The patch seems to solve the problem, could you resend a version that 
> bumps the PR as well? Once this in .dev we should apply it to 
> stable/2008 as well.
>
> regards,
>
> Koen
Patch with compilation fix and PR update is attached.

Att.


Jader H. Silva
jader@2mi.com.br
Depto. de desenvolvimento
2MI Tecnologia




--------------050601070201090009010700
Content-Type: text/x-patch;
 name="0001-Fix-libxml-compilation-using-host-zlib.h.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-Fix-libxml-compilation-using-host-zlib.h.patch"

From 8c3c85c6c4d454036342880a7c5ec11b606a57db Mon Sep 17 00:00:00 2001
From: Jader H. Silva <jader@2mi.com.br>
Date: Tue, 7 Apr 2009 14:50:22 -0300
Subject: [PATCH] Fix libxml compilation using host zlib.h

---
 recipes/libxml/libxml2-native.inc      |    1 +
 recipes/libxml/libxml2-native_2.7.2.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/libxml/libxml2-native.inc b/recipes/libxml/libxml2-native.inc
index 3f67152..89516af 100644
--- a/recipes/libxml/libxml2-native.inc
+++ b/recipes/libxml/libxml2-native.inc
@@ -15,6 +15,7 @@ do_configure_prepend () {
 	--with-catalog \
 	--without-docbook \
 	--with-c14n \
+	--with-zlib=${STAGING_INCDIR}/zlib.h \
 	"
 }
 
diff --git a/recipes/libxml/libxml2-native_2.7.2.bb b/recipes/libxml/libxml2-native_2.7.2.bb
index 24261d6..f82c4e0 100644
--- a/recipes/libxml/libxml2-native_2.7.2.bb
+++ b/recipes/libxml/libxml2-native_2.7.2.bb
@@ -1,2 +1,2 @@
 require libxml2-native.inc
-PR = "r2"
+PR = "r3"
-- 
1.5.6.3


--------------050601070201090009010700--
