Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2E11C6EC6B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 12:37:35 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id q9so1406659ykb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 04:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=RQ4yDxCYEEM1yobAsYstsm92H+33onsJhQgUGVy93ns=;
	b=K85vUsEVJO5vV6PjBpwdwSQqHh25KL/+znbdQu+QugzHBBwVFIDJDMMJV9CIDx1RfM
	sWYXEvNz9x0I78qLTrWrrZhItUL+JnyT4bLiQXIS304cmX22iuatZj3pmo5OLdCMDObI
	/ryC89bYL9YeSntPf83X+y+2HF2Qs4QuiUkWCj82vYcYmokY6mjwT/3SccGxv9slzXkm
	yD/EPaZsRbc3tPEXOvSVRkiiZ+MVfcGP/VW3tah51VhDwOBXjFCKiO5uvCETmOGvSgVl
	vNl7tNTjR8skcQ6/QIrnGTMmE7gChABjggtV1hZf9vrK/k7bNdYfAZiYdfFX9vXTBlxi
	WMRw==
MIME-Version: 1.0
X-Received: by 10.236.118.212 with SMTP id l60mr2761368yhh.78.1392899856123;
	Thu, 20 Feb 2014 04:37:36 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Thu, 20 Feb 2014 04:37:36 -0800 (PST)
In-Reply-To: <CAP9ODKqGy4-cOisGa-cV06kHAs7UKt_=yM+Mv6=W-uyuj5RFfA@mail.gmail.com>
References: <1392780156-11122-1-git-send-email-otavio@ossystems.com.br>
	<20140220121807.GD3854@jama>
	<CAP9ODKqGy4-cOisGa-cV06kHAs7UKt_=yM+Mv6=W-uyuj5RFfA@mail.gmail.com>
Date: Thu, 20 Feb 2014 09:37:36 -0300
X-Google-Sender-Auth: 4juzHbL-86nQQzH6c5aykH-C65A
Message-ID: <CAP9ODKoU3MQvkGOOnma7=9MUU-puwUkn=srDGMW9L2=u18DvWw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qmake5_base.bbclass: Use Qt version specific paths
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
X-List-Received-Date: Thu, 20 Feb 2014 12:37:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Thu, Feb 20, 2014 at 9:22 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Thu, Feb 20, 2014 at 9:18 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Wed, Feb 19, 2014 at 12:22:36AM -0300, Otavio Salvador wrote:
>>> When looking for Qt5 components and files we ought to use the Qt5
>>> specific path. In case the distribution wants to have a flat tree it
>>> can set QT_DIR_NAME and it will still works as expected.
>>
>> NAK
>>
>> I don't think this is good idea, end-user applications shouldn't install
>> their data, archdata, examples etc in qt5 subdirectories.
>>
>> https://github.com/meta-qt5/meta-qt5/wiki/Building-with-OE#wiki-bad-include-paths-and-build-failing-to-find-qt5-headers
>>
>> If you don't care about qt4/qt5 separation just set empty QT_DIR_NAME
>> and all qtmodules will fold into default directories and you won't need
>>
>> OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"
>>
>> listed in above wiki.
>
> and what about we change just the headers? I want to avoid every
> recipe using Qt5 and qmake to require setting the headers var.

Like this:

commit 0f8dc68b8bc8f129fbba4ee3692884f2324e9d28
Author: Otavio Salvador <otavio@ossystems.com.br>
Date:   Tue Feb 18 14:03:49 2014 -0300

    qmake5_base.bbclass: Use Qt version path for headers

    When looking for Qt5 headers we ought to use the Qt5 specific path. In
    case the distribution wants to have a flat tree it can set QT_DIR_NAME
    and it will still works as expected.

    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 3861cd0..0cfb5a4 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -57,7 +57,7 @@ do_generate_qt_config_file() {
     cat > ${QT_CONF_PATH} <<EOF
 [Paths]
 Prefix = ${OE_QMAKE_PATH_PREFIX}
-Headers = ${OE_QMAKE_PATH_HEADERS}
+Headers = ${OE_QMAKE_PATH_QT_HEADERS}
 Libraries = ${OE_QMAKE_PATH_LIBS}
 ArchData = ${OE_QMAKE_PATH_ARCHDATA}
 Data = ${OE_QMAKE_PATH_DATA}


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

