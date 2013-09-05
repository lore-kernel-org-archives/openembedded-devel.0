Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0167461577
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 22:32:39 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id m16so4125643ieq.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 15:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=EknuNVMxM5JLEzqxR0zOZmZ3hxHp5gEFRUfqkJ5gVFY=;
	b=aRFEDMLB1M1wcgIppNoCC5Q0r6jHj6JG40vRry55ptSBWwLMMM9KPlyUxGaO6R9Tjj
	V9Ju0qn1oxJ9JRhys11i8IQGVM5eKV9HHBzPAC6EsVISI4I8kGM6ErZNdynCL6XDlaEj
	lf+h1u5i40Z9QE96LmJmtzv+F3CSaM4vOchQ2ZyspZo4exg59zuifla7SLMwrvv+aGvk
	nVHG5IEi8uZ6nS7iPsN4lOn3eIMqgk19A2fVh8TYdmLBM6FH3zuodsVkuPy3OvysoAR3
	FR1nB4HgL0YaCO625eaFIwZV+7KbFQ+E+754Y4iKbwgkbZSPm6yCxWUqBKpkW3jvhp3j
	ZV6A==
X-Received: by 10.50.61.179 with SMTP id q19mr7748374igr.33.1378420361671;
	Thu, 05 Sep 2013 15:32:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.195 with HTTP; Thu, 5 Sep 2013 15:32:11 -0700 (PDT)
In-Reply-To: <20130905211839.GM11500@jama>
References: <1378414975-13587-1-git-send-email-raj.khem@gmail.com>
	<20130905211839.GM11500@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Sep 2013 15:32:11 -0700
Message-ID: <CAMKF1soaQ1cgSR2-BG6su07+2EvgwW0qP==EBy5ttPXX_7eQtQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] inetutils: Remove empty usr/lib
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
X-List-Received-Date: Thu, 05 Sep 2013 22:32:40 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 5, 2013 at 2:18 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Sep 05, 2013 at 02:02:55PM -0700, Khem Raj wrote:
>> This directory is empty and is flagged by QA checker
>>
>> ERROR: QA Issue: inetutils: Files/directories were installed but not
>> shipped
>>   /usr/lib
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
>> index 7c7343e..e371ae5 100644
>> --- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
>> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
>> @@ -70,6 +70,8 @@ do_install_append () {
>>      cp ${WORKDIR}/telnet.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/telnet
>>      cp ${WORKDIR}/tftpd.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/tftpd
>>      rm -rf ${D}${libexecdir}/
>> +    # remove usr/lib if empty
>> +    rmdir ${D}${libdir}
>
> The comment suggests missing --ignore-fail-on-non-empty

hmmm,I would add it when that happens and also then take opportunity
to make sure that they are packaged
into right packages, so far I have not found a case where its populated.

>
>>  }
>>
>>  PACKAGES =+ "${PN}-ping ${PN}-ping6 ${PN}-hostname ${PN}-ifconfig \
>> --
>> 1.8.4
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

