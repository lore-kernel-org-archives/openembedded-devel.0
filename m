Return-Path: <andrey.rusalin@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 11E1C73FFF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2015 13:17:59 +0000 (UTC)
Received: by lbbzk7 with SMTP id zk7so29304082lbb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2015 06:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	bh=9koZtPxqkGRZzsAmxV/Y2Y60X0rBXCxq4RQD+CZKzW4=;
	b=JwexHvnC1yyRTWKZO7LQ0FE0MXolkEvsCaIiIp5FjrzzvadSdQ4aZc9mxw2Yv0O3ru
	DyvF9obYfZlHR9E+LiKK82MV+63wyzB2osJJTUtcErOwJIKVYM60FNpNKWrVTTTp5vpB
	Du5PxWJeeZhwjrhvXeDxVV4BKfj9vGvuaQ1okWiqmh5vX0F9Ac6SoYzhwoyjNksC7QOv
	keo4h1cf4eAi5dRrsCprOwLEPFG0WbwgIRdPRlEVncctac9syyMZF2RzMIVyf8O5Vm54
	dHqiFgdEN8fMbK8nVEoUrviGMjk5zrO+xPPBTvWVnpsNXdtMIoenE09b7A9/d4Ys9L1A
	2uWw==
X-Received: by 10.112.173.167 with SMTP id bl7mr15989140lbc.83.1431523079840; 
	Wed, 13 May 2015 06:17:59 -0700 (PDT)
Received: from [192.168.14.119] (mail.dev.rtsoft.ru. [213.79.90.226])
	by mx.google.com with ESMTPSA id w7sm4983428lag.42.2015.05.13.06.17.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 May 2015 06:17:58 -0700 (PDT)
Message-ID: <55534F0E.1000900@gmail.com>
Date: Wed, 13 May 2015 16:18:06 +0300
From: Andrey Rusalin <andrey.rusalin@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <55532B2B.8050209@dev.rtsoft.ru> <555338B0.5060401@gmail.com>
	<20150513123957.GB2411@jama>
In-Reply-To: <20150513123957.GB2411@jama>
Subject: Re: [meta-qt5][PATCH]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 May 2015 13:18:00 -0000
X-Groupsio-MsgNum: 55499
Content-Type: multipart/mixed; boundary="------------050905060008070903000600"

--------------050905060008070903000600
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

I agree with SOB. Also correct patch is attached.

On 05/13/2015 03:39 PM, Martin Jansa wrote:
> On Wed, May 13, 2015 at 02:42:40PM +0300, Andrey Rusalin wrote:
>>
> Missing SOB line and patchwork doesn't pick forwarded inline patches
> correctly.
>
> I've fixed both when cherry-picking to master-next, but please reply that you agree with your SOB.
>
>> -------- Forwarded Message --------
>> Subject: 	[meta-qt5][PATCH]
>> Date: 	Wed, 13 May 2015 13:44:59 +0300
>> From: 	arusalin <arusalin@dev.rtsoft.ru>
>> To: 	openembedded-devel@lists.openembedded.org
>>
>>
>>
>> -- 
>> Best Regards,
>> Andrey Rusalin.
>>
>>
>>
>>
>>  From 7040c6382af3d99f53b3f9fa45336cb911438923 Mon Sep 17 00:00:00 2001
>> From: Andrey Rusalin <arusalin@dev.rtsoft.ru>
>> Date: Wed, 13 May 2015 14:25:42 +0400
>> Subject: [PATCH] Fixed dependency for sql-mysql option of qtbase package
>>
>> ---
>>   recipes-qt/qt5/qtbase.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
>> index 50cb505..d2654ef 100644
>> --- a/recipes-qt/qt5/qtbase.inc
>> +++ b/recipes-qt/qt5/qtbase.inc
>> @@ -84,7 +84,7 @@ PACKAGECONFIG[cups] = "-cups,-no-cups,cups"
>>   PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
>>   PACKAGECONFIG[xcb] = "-xcb -xcb-xlib -system-xcb,-no-xcb,libxcb xcb-util-wm xcb-util-image xcb-util-keysyms xcb-util-renderutil"
>>   PACKAGECONFIG[sql-ibase] = "-sql-ibase,-no-sql-ibase"
>> -PACKAGECONFIG[sql-mysql] = "-sql-mysql,-no-sql-mysql,mysql"
>> +PACKAGECONFIG[sql-mysql] = "-sql-mysql,-no-sql-mysql,mysql5"
>>   PACKAGECONFIG[sql-psql] = "-sql-psql,-no-sql-psql,postgresql"
>>   PACKAGECONFIG[sql-odbc] = "-sql-odbc,-no-sql-odbc"
>>   PACKAGECONFIG[sql-oci] = "-sql-oci,-no-sql-oci"
>> -- 
>> 1.9.1
>>
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

-- 
Best Regards,
Andrey Rusalin.


--------------050905060008070903000600
Content-Type: text/x-patch;
 name="0001-Fixed-dependency-for-sql-mysql-option-of-qtbase-pack.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-Fixed-dependency-for-sql-mysql-option-of-qtbase-pack.pa";
 filename*1="tch"

From 8b7d3580732c5ad9a8148cdca6a6413ecf0bbd49 Mon Sep 17 00:00:00 2001
From: Andrey Rusalin <arusalin@dev.rtsoft.ru>
Date: Wed, 13 May 2015 17:15:21 +0400
Subject: [PATCH] Fixed dependency for sql-mysql option of qtbase package

Signed-off-by: Andrey Rusalin <arusalin@dev.rtsoft.ru>
---
 recipes-qt/qt5/qtbase.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 50cb505..d2654ef 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -84,7 +84,7 @@ PACKAGECONFIG[cups] = "-cups,-no-cups,cups"
 PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
 PACKAGECONFIG[xcb] = "-xcb -xcb-xlib -system-xcb,-no-xcb,libxcb xcb-util-wm xcb-util-image xcb-util-keysyms xcb-util-renderutil"
 PACKAGECONFIG[sql-ibase] = "-sql-ibase,-no-sql-ibase"
-PACKAGECONFIG[sql-mysql] = "-sql-mysql,-no-sql-mysql,mysql"
+PACKAGECONFIG[sql-mysql] = "-sql-mysql,-no-sql-mysql,mysql5"
 PACKAGECONFIG[sql-psql] = "-sql-psql,-no-sql-psql,postgresql"
 PACKAGECONFIG[sql-odbc] = "-sql-odbc,-no-sql-odbc"
 PACKAGECONFIG[sql-oci] = "-sql-oci,-no-sql-oci"
-- 
1.9.1


--------------050905060008070903000600--
