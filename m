Return-Path: <samuli.piippo@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7582A76A51
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Sep 2015 13:07:37 +0000 (UTC)
Received: by wiclp12 with SMTP id lp12so30212222wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Sep 2015 06:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=yhWRFb7VenworgIX1IFwwHj9ydcPJgWmbgtEVObg4zc=;
	b=D3ldP8ZBDpXEhWu59LOaUW1CTVXmI4VC1+zJ3pW/Bes03qGECaFO8fyk1p4Triw5+i
	Q59q6xZ81mnuou8EfqZXm1TiIKSoleAYQIBAijgdzL3M6EYgfg7rrZ08xXLZqF18GHbz
	Ib7TFbdubn7AwP+uyuUSqlmkyuYFxVB2Uoh9nWuK6EEHeE/p0+w6xYWTBt3fm8EpGrpT
	sByEKCbGWsdbRhHQZpi2jRjrdAXUGaR0brtP1gCd1nHIf4jy8t9KGW5ib0eeB+q/xvCi
	SsX4w/+kc4yBBA3CJ+7wCuq9Kpkx9aIsuhFDe/YTlRtaXl+KF8dlxj0nf2NiML9nw252
	w93g==
X-Received: by 10.180.105.36 with SMTP id gj4mr3140484wib.49.1441112855768;
	Tue, 01 Sep 2015 06:07:35 -0700 (PDT)
Received: from [10.9.5.47] ([91.217.248.11])
	by smtp.googlemail.com with ESMTPSA id
	cd16sm2673027wib.19.2015.09.01.06.07.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Sep 2015 06:07:34 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
	<63bae5e8f510c228002db87998ad031708fc69dd.1440502860.git.samuli.piippo@theqtcompany.com>
	<55E2F755.5030003@gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <55E5A316.9000300@gmail.com>
Date: Tue, 1 Sep 2015 16:07:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <55E2F755.5030003@gmail.com>
Subject: Re: [meta-qt5][PATCH v2 04/11] qt5: add host paths to qt.conf
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
X-List-Received-Date: Tue, 01 Sep 2015 13:07:41 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 30.08.2015 15:30, Jonathan Liu wrote:
> On 25/08/2015 9:43 PM, Samuli Piippo wrote:
>> Add missing HostData and HostLibraries paths to qt.conf for qmake.
>> Using the target sysroot for the HostData, allows us to remove the
>> symbolic link for the mkspecs.
>>
>> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
>> ---
>>   classes/populate_sdk_qt5.bbclass | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/classes/populate_sdk_qt5.bbclass
>> b/classes/populate_sdk_qt5.bbclass
>> index d29ec36..3f33b23 100644
>> --- a/classes/populate_sdk_qt5.bbclass
>> +++ b/classes/populate_sdk_qt5.bbclass
>> @@ -4,10 +4,6 @@
>>   inherit qmake5_paths
>>   create_sdk_files_prepend () {
>> -    # make a symbolic link to mkspecs for compatibility with QTCreator
>> -    (cd ${SDK_OUTPUT}/${SDKPATHNATIVE}; \
>> -         ln -sf ${SDKTARGETSYSROOT}${libdir}/${QT_DIR_NAME}/mkspecs
>> mkspecs;)
>> -
>>       # Generate a qt.conf file to be deployed with the SDK
>>
>> qtconf=${SDK_OUTPUT}/${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qt.conf
>>       touch $qtconf
>> @@ -28,5 +24,7 @@ create_sdk_files_prepend () {
>>       echo 'Examples =
>> ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_EXAMPLES}' >> $qtconf
>>       echo 'Tests = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_TESTS}' >>
>> $qtconf
>>       echo 'HostPrefix = ${SDKPATHNATIVE}' >> $qtconf
>> +    echo 'HostData = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_ARCHDATA}'
>> >> $qtconf
>>       echo 'HostBinaries = ${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}'
>> >> $qtconf
>> +    echo 'HostLibraries = ${SDKPATHNATIVE}${OE_QMAKE_PATH_LIBS}' >>
>> $qtconf
>>   }
> This works but is it logically correct to use a directory that contains
> binaries compiled for the target as the host data directory...?
> The mkspecs are architecture independent but the plugins are target
> specific.
>
> Regards,
> Jonathan

HostData doesn't seem to have other usages than finding mkspecs, at 
least on Qt modules. When compiling Qt with external toolchain, HostData 
and ArchData are the same, unless explicitly separated. Logically maybe 
not the best, but I think it's still better than the symlink.

-samuli

