Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2C1296E97D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 11:38:05 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id c41so6631977yho.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 03:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Uj77gyF1eu4WH3eDd9LD04Mv1w9DEf7BnBPp3ZkiiwA=;
	b=tOpI0hz1S11xD0ofXP8ErHf/qSY9PQMULmi3kjdE7SDhb46EUDe72W0znPDN+cr7pN
	NKCuU3CegRsh2ZKrC3cFmLiKjof6nhT3EklP/W+XZEEXtxWrvdwS0fTjlO1aOvn5DkDI
	e/OxPdOkHvIOZ/HFKxA+PSvJOrtr7Ur/E1lAQCnAUyrSKtXJyfmtJV4KGXNtl53dF6AT
	xn6IXAZQ28TBzYPjQi4mZav68UNLw2+AIzbsfK8oOC+pXn4NOmJwokQ1ARJ002XNW2a9
	50E/Fu/R2vG0266sLlPVtVZXWMO82vXQAdrkmQ07ShOnPgXDFYtj5T0NJWkuoju/IqpL
	m4QA==
MIME-Version: 1.0
X-Received: by 10.236.135.172 with SMTP id u32mr1034883yhi.107.1393328286494; 
	Tue, 25 Feb 2014 03:38:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Tue, 25 Feb 2014 03:38:06 -0800 (PST)
In-Reply-To: <CANwerB1b00ngQgTeeRbiV8kYrmd4rk1Ru2XhYGTD2xx7aF-KgA@mail.gmail.com>
References: <1393273696-9249-1-git-send-email-otavio@ossystems.com.br>
	<1393273696-9249-2-git-send-email-otavio@ossystems.com.br>
	<CANwerB1b00ngQgTeeRbiV8kYrmd4rk1Ru2XhYGTD2xx7aF-KgA@mail.gmail.com>
Date: Tue, 25 Feb 2014 08:38:06 -0300
X-Google-Sender-Auth: H5oRNx0zQLCuoUcqHfhhVhcxKkg
Message-ID: <CAP9ODKpEZ229hKeS6ajkYQp14Z9OGbUhOU-8jR7UtApo+7ZvSQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Jonathan Liu <net147@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 1/3] populate_sdk_qt5.bbclass: Fix symlink location for QtCreator use
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
X-List-Received-Date: Tue, 25 Feb 2014 11:38:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 25, 2014 at 12:20 AM, Jonathan Liu <net147@gmail.com> wrote:
> On 25 February 2014 07:28, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> The QtCreator is quite broken regarding finding the mkspecs files; so
>> to workaround it we must to add a symlink to it. The workaround was in
>> place but in the wrong sysroot, it must to be in the /native/ one.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  classes/populate_sdk_qt5.bbclass |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/classes/populate_sdk_qt5.bbclass b/classes/populate_sdk_qt5.bbclass
>> index 3b849e9..635dd6d 100644
>> --- a/classes/populate_sdk_qt5.bbclass
>> +++ b/classes/populate_sdk_qt5.bbclass
>> @@ -27,7 +27,7 @@ toolchain_create_sdk_env_script_append () {
>>      echo 'export QT_CONF_PATH=${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qt.conf' >> $script
>>
>>      # make a symbolic link to mkspecs for compatibility with QTCreator
>> -    (cd ${SDK_OUTPUT}/${SDKTARGETSYSROOT}; \
>> +    (cd ${SDK_OUTPUT}/${SDKPATHNATIVE}; \
>>           ln -sf ${SDKTARGETSYSROOT}${libdir}/${QT_DIR_NAME}/mkspecs mkspecs;)
>>
>>      # Generate a qt.conf file to be deployed with the SDK
>
> Acked-by: Jonathan Liu <net147@gmail.com>
>
> Tested and working. Qt Creator now finds the mkspec after applying this patch.

I  applied this one as it fixes the error. Thanks for testing it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

