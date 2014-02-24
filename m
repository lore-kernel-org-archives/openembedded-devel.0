Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9E59E6E901
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 01:34:59 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 142so12817401ykq.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 17:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=abE1820W0wCEr5OTy92mLyzTGadmR0bm1rMrhnCZk0Q=;
	b=W5J3bicJ8/UyyHAq65+PazRxdG6tkamQKxZk0ZuBt21ooPwnMyRicK1nTKp24uYSoh
	o1xI/zEYwNjNFC7ZZPVQSaGnED7HYeMRcljhrhEpVMHnMuuEgSa7xLXdIJ5xD4cwIpZe
	/XEGYMwS4yELPboNyYwAhG2qWH4y3QRGTW0DzEpDFW3QtXukf7HRfXtHWR2RmQ8YRAwH
	EwVVYWlqaM70RzpiJIERHA4eLyBioZ9R5KWTwypJHQxhJ11XN3h+VWvzD5h9vvCEeIyf
	XrsoRqyZwlHs3cXWdGvn6NzVIMEHe3qVFMihb7DV5X2dWFLYyVlpjrJqPPC0q2b4T4hP
	W40A==
MIME-Version: 1.0
X-Received: by 10.236.158.226 with SMTP id q62mr27795071yhk.2.1393205700797;
	Sun, 23 Feb 2014 17:35:00 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Sun, 23 Feb 2014 17:35:00 -0800 (PST)
In-Reply-To: <20140223150227.GT3854@jama>
References: <1393163414-9494-1-git-send-email-otavio@ossystems.com.br>
	<20140223150227.GT3854@jama>
Date: Sun, 23 Feb 2014 22:35:00 -0300
X-Google-Sender-Auth: fS75QPCunw1EDXGR-6Dh-WFabME
Message-ID: <CAP9ODKpBvjYemm-RWWz-LzYg6iko-BPvMU-Pp2XyObNLkVxbhw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v2 1/4] qmake5_base.bbclass: Use Qt version path for headers
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
X-List-Received-Date: Mon, 24 Feb 2014 01:35:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Feb 23, 2014 at 12:02 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sun, Feb 23, 2014 at 10:50:11AM -0300, Otavio Salvador wrote:
>> When looking for Qt5 headers we ought to use the Qt5 specific path. In
>> case the distribution wants to have a flat tree it can set QT_DIR_NAME
>> and it will still works as expected.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  classes/qmake5_base.bbclass |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
>> index 3861cd0..db6834f 100644
>> --- a/classes/qmake5_base.bbclass
>> +++ b/classes/qmake5_base.bbclass
>> @@ -57,7 +57,7 @@ do_generate_qt_config_file() {
>>      cat > ${QT_CONF_PATH} <<EOF
>>  [Paths]
>>  Prefix = ${OE_QMAKE_PATH_PREFIX}
>> -Headers = ${OE_QMAKE_PATH_HEADERS}
>> +Headers = ${OE_QMAKE_PATH_HEADERS}/${QT_DIR_NAME}
>
> classes/qmake5_paths.bbclass:OE_QMAKE_PATH_HEADERS = "${includedir}"
>
> is the right place

Sorry for missing this, indeed. Fixed in v4.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

