Return-Path: <brunovern.a@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2ECE27318F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 16:33:36 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id bc4so292977022lbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 08:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-type; bh=vwLViUdxkUXagJY1+KcJoJ5e17Rzo+CuQw6rU0LJTtc=;
	b=W7HxwSNhwnPO4wZrbvfcgNCHEHvM/UL8G7ESLLCTaBINKBUykyCxEOy8p/tnFe8ABq
	FAg0EnvpaWWkcgXQJrelROvHGOc1NdoB2xqcHfU5qFBmgX0DCbeGeYN31xoJ+1y8H/Ad
	LkWllOgZ5jT8pL0LjU40HB28wUKU/zdrK3SWQs+j0fXnNwzCxUSVSisAUitIqEu9HTUy
	+4wJH8vzZhzPxzT/4fT4pDblBII4XuU9nZYfrO7veQJTLuREA9ue2FrJFLfAXDI12zpo
	JbaPGMODw6UOZDbeibqFp7AXkYyusSkKkvGmBj2eLBxCtt2qX/9v+WBP8JZu5BHAyMJF
	CXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-type;
	bh=vwLViUdxkUXagJY1+KcJoJ5e17Rzo+CuQw6rU0LJTtc=;
	b=C6rOieCAvK6HbVeW8dZKnAF7AupxYAellRMJ477ZRsBoXfM2YjhuqaRxM6dO/hWMiw
	JbCURBtnbPf7oQc+kbaQ863kmS3084FRabjQ6OBI63A+a3uy9Q7QKp+PZZ0FwZduKX4P
	+Ts9tvsiHT62WmfEg+7/MMT0L1EdJzHDsfoqsr5TcK7QIC5gJIOxVMER0k7EZPBIVFsl
	mZjr4I5ZPF7BPsEf4XMz20y6ZHVj/3AsZlz1ILXQAd3MFEXoIhvDQEgTaJmtD6bOxriT
	KQmaqN6KIzQKnn1K6Hmb72VA7+EcU54jVKqpAJvdp1qGjQKpxsAWMXeWq+PgTCmpMrnZ
	Y/dQ==
X-Gm-Message-State: ALoCoQkYnispKjhzqPfutJ5+/nSbnEh5SJk+7mnsLJ1zntfmxr+aKUBN40VAsxirfUYKH9CgELNgdLnoH6iWetzb6t8NaF+RYQ==
X-Received: by 10.112.180.138 with SMTP id do10mr25417408lbc.127.1452702817112;
	Wed, 13 Jan 2016 08:33:37 -0800 (PST)
MIME-Version: 1.0
References: <CAF3KAoQkwWWr=xfifeqP_bK25_ysY_7+B2h7xT6L9P1Pf34KhQ@mail.gmail.com>
	<CAF3KAoS1+0fy16WjorADA3cqTjCPZwSJGOmjex6b1mKcEQw7oA@mail.gmail.com>
In-Reply-To: <CAF3KAoS1+0fy16WjorADA3cqTjCPZwSJGOmjex6b1mKcEQw7oA@mail.gmail.com>
From: Bruno Vernay <brunovern.a@gmail.com>
Date: Wed, 13 Jan 2016 16:33:27 +0000
Message-ID: <CAF3KAoTLPCK3NMm-NfVgJq80mvQBzz2WYw92p5jM6t2ySi0fAw@mail.gmail.com>
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
X-List-Received-Date: Wed, 13 Jan 2016 16:33:37 -0000
Content-Type: text/plain; charset=UTF-8

I still have errors, but made a recipe bbappend to install "openldap-slapd
openldap-dev"

At run I have:
usr/sbin/slapd: symbol lookup error:
/usr/lib/openldap/openldap/back_mdb-2.4.so.2: undefined symbol:
pthread_key_create

Also note that
/usr/lib/openldap/openldap# strings back_mdb-2.4.so.2.10.5 | grep
thread_key_create
pthread_key_create
/lib# strings libpthread.so.0 |grep thread_key_create
__pthread_key_create

I someone could help?

/************************************************/
PACKAGECONFIG_append = " mdb"
FILES_${PN} += "${datadir}/${BPN}-data"
do_install_append() {
    # Uses mdm as the database
    #  and datadir as data directory ...
    sed -e 's/# modulepath/modulepath/' \
        -e 's/# moduleload\s*back_bdb/moduleload    back_mdb/' \
        -e 's/database\s*bdb/database        mdb/' \
        -e 's%^directory\s*.*%directory   ${datadir}/${BPN}-data/%' \
        -i ${D}${sysconfdir}/openldap/slapd.conf

    # Add debug info to the service
    sed -e 's/ \$slapd$/ \$slapd -- -d -1/' \
        -i ${D}${sysconfdir}/init.d/openldap

    mkdir -p ${D}${datadir}/${BPN}-data
}
/**************************************************/





On Wed, Jan 13, 2016 at 11:12 AM Bruno Vernay <brunovern.a@gmail.com> wrote:

> To get the all the required files, I had to add the openldap-dev package.
> Also the data dir: /var/openldap-data is not created by the recipe.
> Regards
>
> On Tue, Jan 12, 2016 at 1:51 PM Bruno Vernay <brunovern.a@gmail.com>
> wrote:
>
>> Hi
>> It seems that OpenLDAP modules are build, but not all files are installed
>> on the target.
>> I created an issue in GitHub:
>> https://github.com/openembedded/meta-openembedded/issues/21
>>
>> Also I could not find any example or documentation on how to use this
>> recipe (had to look at the code and trial and error). Is it the way to go
>> or is there a place to contribute examples at least?
>>
>> Regards
>> Bruno
>>
>>

