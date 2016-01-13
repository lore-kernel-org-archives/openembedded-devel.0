Return-Path: <brunovern.a@gmail.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4CE8C6FFF2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 16:46:52 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id 17so56968824lfz.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 08:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-type; bh=NywNFBqhBpgOLC4rp8feqVUsNTcpP7+7AqektDOOm5U=;
	b=O0/zt91ZRqDuA6EOkF0OZgu1qoGQT11cuVzUtdk8AIrVp84cqiDte3rRmqJTc6V++t
	eFY7jsMKNSCTLqULYqvJF0He0i0DeP73HHfGwtVD3AUJ84TZLc1n0RPRBBiDOlK/l2yc
	uiSYiR2OevxQ26GhN3lt0Owgf0VVvO/fcS89QpdMfckByXoYn2I4DocZUwaCKsEdd083
	XZyPh+4I62OldFS+wtXzpQNfYI2bugSIGANq55vqQ+/EEctxXkQ4z02xpoKq18LgoUiX
	8VSeFLCMCBM8rlkl8DiuENOHRSlHUQZA0nja+89ASM30Zkj8P6H4yBCs32BQDP3h25Tx
	V5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-type;
	bh=NywNFBqhBpgOLC4rp8feqVUsNTcpP7+7AqektDOOm5U=;
	b=JE0vdunsevXzHlcLUNfb37eLVk5EVa8eXZq2CMofQsKc7MiGKRFNGitClEZEbU335f
	ePSj858xjkYWB1PEqxsCcIrC7xH7YRFpwdmq0ujp9yIm1uhb1evNIb2e+PLekUyUZTw0
	1ll/OvYMUEi61lKxlkTnd0CmeQAnO0Sj3hV1cVtxEQoPpuca//8qiSs5JXBDgNHV6TqG
	cWTkANWtjNfr1c+zyOcASjJY68xc70K0S0JlhjoHMQiPtWziXTzz3eEo1EabuOIF8H82
	YoB2s2OZDHbBnv/Yw8Tfy4OiAbky4QOp2wzs4v2IsW25lXJ3RoFZ9T2XVth8owQ2dgnm
	saFA==
X-Gm-Message-State: ALoCoQk0pZm6I/jC2+OLdao3Kd6QRw+B93aXN51syI2ie2U+XXa+1wEBndxOqsZuTTIdPralTa4BurfVxnAFiCzzTBrS+R2nrA==
X-Received: by 10.25.22.167 with SMTP id 39mr14612353lfw.153.1452703613145;
	Wed, 13 Jan 2016 08:46:53 -0800 (PST)
MIME-Version: 1.0
References: <CAF3KAoQkwWWr=xfifeqP_bK25_ysY_7+B2h7xT6L9P1Pf34KhQ@mail.gmail.com>
	<CAF3KAoS1+0fy16WjorADA3cqTjCPZwSJGOmjex6b1mKcEQw7oA@mail.gmail.com>
	<CAF3KAoTLPCK3NMm-NfVgJq80mvQBzz2WYw92p5jM6t2ySi0fAw@mail.gmail.com>
In-Reply-To: <CAF3KAoTLPCK3NMm-NfVgJq80mvQBzz2WYw92p5jM6t2ySi0fAw@mail.gmail.com>
From: Bruno Vernay <brunovern.a@gmail.com>
Date: Wed, 13 Jan 2016 16:46:43 +0000
Message-ID: <CAF3KAoRyD7EXhOBjECXnyZzTWAW8P65=GJScxr1TGtoveH_HTA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe] OpenLDAP modules
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
X-List-Received-Date: Wed, 13 Jan 2016 16:46:53 -0000
Content-Type: text/plain; charset=UTF-8

Adding this to my bbappend did the trick ...

TARGET_CC_ARCH += "-lpthread"

I may submit a patch


On Wed, Jan 13, 2016 at 5:33 PM Bruno Vernay <brunovern.a@gmail.com> wrote:

> I still have errors, but made a recipe bbappend to install "openldap-slapd
> openldap-dev"
>
> At run I have:
> usr/sbin/slapd: symbol lookup error:
> /usr/lib/openldap/openldap/back_mdb-2.4.so.2: undefined symbol:
> pthread_key_create
>
> Also note that
> /usr/lib/openldap/openldap# strings back_mdb-2.4.so.2.10.5 | grep
> thread_key_create
> pthread_key_create
> /lib# strings libpthread.so.0 |grep thread_key_create
> __pthread_key_create
>
> I someone could help?
>
> /************************************************/
> PACKAGECONFIG_append = " mdb"
> FILES_${PN} += "${datadir}/${BPN}-data"
> do_install_append() {
>     # Uses mdm as the database
>     #  and datadir as data directory ...
>     sed -e 's/# modulepath/modulepath/' \
>         -e 's/# moduleload\s*back_bdb/moduleload    back_mdb/' \
>         -e 's/database\s*bdb/database        mdb/' \
>         -e 's%^directory\s*.*%directory   ${datadir}/${BPN}-data/%' \
>         -i ${D}${sysconfdir}/openldap/slapd.conf
>
>     # Add debug info to the service
>     sed -e 's/ \$slapd$/ \$slapd -- -d -1/' \
>         -i ${D}${sysconfdir}/init.d/openldap
>
>     mkdir -p ${D}${datadir}/${BPN}-data
> }
> /**************************************************/
>
>
>
>
>
> On Wed, Jan 13, 2016 at 11:12 AM Bruno Vernay <brunovern.a@gmail.com>
> wrote:
>
>> To get the all the required files, I had to add the openldap-dev package.
>> Also the data dir: /var/openldap-data is not created by the recipe.
>> Regards
>>
>> On Tue, Jan 12, 2016 at 1:51 PM Bruno Vernay <brunovern.a@gmail.com>
>> wrote:
>>
>>> Hi
>>> It seems that OpenLDAP modules are build, but not all files are
>>> installed on the target.
>>> I created an issue in GitHub:
>>> https://github.com/openembedded/meta-openembedded/issues/21
>>>
>>> Also I could not find any example or documentation on how to use this
>>> recipe (had to look at the code and trial and error). Is it the way to go
>>> or is there a place to contribute examples at least?
>>>
>>> Regards
>>> Bruno
>>>
>>>

