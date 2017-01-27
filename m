Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0A545772F0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 01:03:19 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 194so23603291pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 17:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=xjANKtCdeE/SRvpp84v0elFElKn44TTv1O+R6rJ9jPg=;
	b=mZHZRVUZGCdPQ1b8iPABdHOS31vvCnhS8iYr/kYKm2wRRd0OzXgwNfC7GohWqZ0NlF
	wFHGKQsR0X7RSRxLQ0whAfG1U0uzRl3Y8HrTIf03wXZ9Pbp98pMwOejZ30fHTzgLNvgO
	jvJxRpg4kgH3Ko/jrbEVvUjoACYqiDJauWihVtJUvqsQH2WBMrCESWeW0sukeKbd6Mow
	vr6hTIZ6DlEPXB+nv4J3xiLKfTrujWegJ1tqcm8SQdN522H3xmmNopf+PRA0fttajm4Z
	qJLqEggdLrMqcWswAIGrxAujxEjwVaPn6TCKcsmqzgozulduCIgc+XpcM+M/0UZ6I9BS
	Wiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=xjANKtCdeE/SRvpp84v0elFElKn44TTv1O+R6rJ9jPg=;
	b=pt7LUTK4vkaw+T1XfQyMbwiUM7HkzSibRtmEClzTJ1Ri+c1VgVG6jyJ3m7r8BbA+n7
	qr/y7Z1vBu3V3yGT5g5PaxsL/RaDsiEY1C+0rFSSOa52VjqJWRUn7W8/3JTed9Jp9lgf
	5arft8x5gS1hLckVO8WFQJVhZX0i2H30Ly9mCB+FhJijc7OYqbDxKoRmZe7d/PFLCIhC
	LdDfltLM8FkkNZ2FU/gommuyztZaWdzAdOEQwktplbMedWYnJRAsdnf8EZyn4Pc+p+TZ
	7eEnt+uDYog1tLbyApjYD1hxKnMsDdRBxnPmN674UEc0+cFKPC7wzIVm3YeRyWcy6BFd
	uBNg==
X-Gm-Message-State: AIkVDXJNUFhDPpZTEDFi+PuJbXGJu3FrvAr+/RAeb341FSBwMUfeoJuVqgrf6TseoG7Gqw==
X-Received: by 10.98.215.27 with SMTP id b27mr6230955pfh.70.1485479000073;
	Thu, 26 Jan 2017 17:03:20 -0800 (PST)
Received: from CACSVMO-14452.local (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	x81sm6067774pff.69.2017.01.26.17.03.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jan 2017 17:03:19 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1484608187-28597-1-git-send-email-max.krummenacher@toradex.com>
	<1484608187-28597-2-git-send-email-max.krummenacher@toradex.com>
	<CAEHkU3UX4NhOVvg6QXcuWgw_H5Z1EaOgih3Lsj9D+hfvC1s44A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <5dfb289d-2a44-1233-3761-f7e372c6dafc@gmail.com>
Date: Thu, 26 Jan 2017 17:03:18 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAEHkU3UX4NhOVvg6QXcuWgw_H5Z1EaOgih3Lsj9D+hfvC1s44A@mail.gmail.com>
Subject: Re: [meta-browser][PATCH 2/2] README: add -s to git send-email example
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jan 2017 01:03:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

what happens if commits are already having a sign-off ?

On 1/26/17 2:27 PM, Max Krummenacher wrote:
> ping
> 
> Any comments on this one?
> 
> Max
> 
> 2017-01-17 0:09 GMT+01:00 Max Krummenacher <max.oss.09@gmail.com>:
>> Prevent missing Signed-off-by lines.
>>
>> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>> ---
>>  README | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/README b/README
>> index 647404b..effe2f9 100644
>> --- a/README
>> +++ b/README
>> @@ -26,7 +26,7 @@ Maintainers: Eric Bénard <eric@eukrea.com>
>>               Otavio Salvador <otavio@ossystems.com.br>
>>
>>  When sending single patches, please use something like :
>> -git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-browser][PATCH'
>> +git send-email -1 -s --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-browser][PATCH'
>>
>>  TODO
>>  ----
>> --
>> 2.6.6
>>

