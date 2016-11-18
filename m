Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id DB21371976
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 15:25:48 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c4so11205668pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 07:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=Gme/nXcHWvIi1Y+iM4Rgew7FrxxpLB9+jce2fE83siU=;
	b=VZs5171yx1qMRZWO9qczd59hwoJBqJjC9SvfKOD1uEvUtNklx93K9mNSkjfBd4u3y+
	tK5NIt7rHkpzW0eKb0z+l2xTWJLnuIOjJJeGM7IgqlGhSlvSarIFnpqDML3hWxgHr9wF
	CXvW24q1PvaxlCmAIgYMX5ZVgZydDLI0favIlgmMGCGlCNegEQT6+OB+uQ8/+eEkb5Ox
	DjfSD4CqxBYdyGljZBJrh02Emd9cJaQx8EDEGwsHHuJA/ZqanLYJtyUHUV5ZegwtMyTE
	4n+NcxRVUFDLXnKGlvdzfyS4iem8Jw4stDvtGCHc7zmWON79aBKJ5xZa0wbViRYYvDC5
	QoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Gme/nXcHWvIi1Y+iM4Rgew7FrxxpLB9+jce2fE83siU=;
	b=Ths8MFI2lOVsiY6IlNllqfFKZaN+GTwQLs5JYT8+s7Mwp3Z1EXQ/TIucJ4ZEqED9HD
	Eprzfj/m4H3Y6AhcTjoJNZm6kTu5koc6/ZllyssmY6YX/k4feDw1I1UO7frF9ZFcPqzw
	cIvBTCImcF7M4+k2+9bQeVfU/GVIE+mAlEOYXNSEgpEaQrKfQFAoKXHO+1liq4/J8V4Y
	uUrNxqH2eASVuL3qQKKHCl8/AxblpH4umuYHzl0HNS84qFxLTWEyrsb9E3+cUqVT8d4c
	dw/aL+sGnRw3KYdFvJSOtGXdG35EnJcGcZsubpxcuCneG1of/hpwzEewzVurm/XWtXlG
	UAuQ==
X-Gm-Message-State: AKaTC03lRstE2Os9baOKiAWyxY0xD29eF3LzRFUysr/MpPP9DQmL0Ii9817yivKeAcWOsQ==
X-Received: by 10.99.209.5 with SMTP id k5mr473652pgg.13.1479482750269;
	Fri, 18 Nov 2016 07:25:50 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:31d0:92df:f69d:58e2?
	([2601:202:4001:9ea0:31d0:92df:f69d:58e2])
	by smtp.gmail.com with ESMTPSA id
	a66sm18860382pfa.64.2016.11.18.07.25.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Nov 2016 07:25:49 -0800 (PST)
To: Denys Dmytriyenko <denis@denix.org>,
	openembedded-devel@lists.openembedded.org
References: <1477587755-24666-1-git-send-email-denis@denix.org>
	<271f87f6-ac90-2389-3499-9c3bb8d80fa6@gmail.com>
	<20161114190940.GB22657@denix.org> <20161117035859.GB26131@denix.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <af58f301-6a21-6f9b-3c87-26fa8d44935b@gmail.com>
Date: Fri, 18 Nov 2016 07:25:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161117035859.GB26131@denix.org>
Subject: Re: [meta-oe][krogoth][PATCH] syslog-ng: expand service file @variables@ earlier
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
X-List-Received-Date: Fri, 18 Nov 2016 15:25:50 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 11/16/2016 07:58 PM, Denys Dmytriyenko wrote:
> On Mon, Nov 14, 2016 at 02:09:40PM -0500, Denys Dmytriyenko wrote:
>> On Thu, Nov 03, 2016 at 08:20:53AM -0700, akuster808 wrote:
>>>
>>> On 10/27/2016 10:02 AM, Denys Dmytriyenko wrote:
>>>> From: Ian Ray <ian.ray@ge.com>
>>>>
>>>> Move variable expansion of @SBINDIR@, @LOCALSTATEDIR@, and @BASEBINDIR@
>>>> earlier during install, to before the systemd service file is installed
>>>> by an automake rule.
>>>>
>>>> Signed-off-by: Ian Ray <ian.ray@ge.com>
>>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>> merged to staging.
>> Armin,
>>
>> Any updates on this? Also, I don't see it in krogoth-next - what staging you
>> are referring to?
> Ping again, this time copy Armin directly.
oops, Had it sitting on my system forgot to push to contrib. Pull 
request sent.

- Armin
>
>
>>>>   meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 9 ++++++---
>>>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
>>>> index 4e0f697..898e9c2 100644
>>>> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
>>>> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
>>>> @@ -60,6 +60,12 @@ do_configure_prepend() {
>>>>       eval "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
>>>>   }
>>>>   
>>>> +do_install_prepend() {
>>>> +    sed -i -e 's,@SBINDIR@,${sbindir},g' ${S}/contrib/systemd/*.service
>>>> +    sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${S}/contrib/systemd/*.service
>>>> +    sed -i -e 's,@BASEBINDIR@,${base_bindir},g' ${S}/contrib/systemd/*.service
>>>> +}
>>>> +
>>>>   do_install_append() {
>>>>       install -d ${D}/${sysconfdir}/${BPN}
>>>>       install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${BPN}/${BPN}.conf
>>>> @@ -70,9 +76,6 @@ do_install_append() {
>>>>       install -d ${D}/${localstatedir}/lib/${BPN}
>>>>       # Remove /var/run as it is created on startup
>>>>       rm -rf ${D}${localstatedir}/run
>>>> -    sed -i -e 's,@SBINDIR@,${sbindir},g' ${S}/contrib/systemd/*.service
>>>> -    sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${S}/contrib/systemd/*.service
>>>> -    sed -i -e 's,@BASEBINDIR@,${base_bindir},g' ${S}/contrib/systemd/*.service
>>>>   }
>>>>   
>>>>   FILES_${PN} += "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/tools"
>>>>
>>> -- 
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


