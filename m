Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id AE73B6F751
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 16:26:20 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id f10so5512532yha.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 09:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=+VN/kPu079mFCPhLzoPWFwa5hHZTGSzVpAVb1bVykoY=;
	b=H99JgNIOcXmvFkCuPBnGFLSJkgp/zeNHfrLHszmkcyN6XWox4fAHiugYVjyXtNEd4n
	vTtdz2P7h5MDqvitHcgURLUhRV5z3wTlakvbnykFRmnHAFiMNAlD0kG3xL/qLjTj+sO6
	5kjrcKzUp7QpmzYrj42nwhh9Ojwr5RKGcL3oczq0t32WS5Y9ZvO46/IQTaH5wqatZke7
	oOE+2YqKxmQWJLZ5fuL71s6DVcf0G0JDPx1yXf4bkpz5DqjFg3A4BhaeBHtBzg1YfUoQ
	AqYRmmfOZE4XWCLI4DBi6o5jmKQbOjN7yBKBGN83srMdUsNIYGN7w067KgvgzV3hhPBL
	OMsA==
MIME-Version: 1.0
X-Received: by 10.236.198.197 with SMTP id v45mr10732700yhn.87.1395073581396; 
	Mon, 17 Mar 2014 09:26:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Mon, 17 Mar 2014 09:26:21 -0700 (PDT)
In-Reply-To: <20140311141735.GC2137@jama>
References: <lauren.post@freescale.com>
	<1394227575-27897-1-git-send-email-lauren.post@freescale.com>
	<1394227575-27897-6-git-send-email-lauren.post@freescale.com>
	<20140311141735.GC2137@jama>
Date: Mon, 17 Mar 2014 13:26:21 -0300
X-Google-Sender-Auth: aZ-TmfCrE5zRgr2kkR4uY6Vecfo
Message-ID: <CAP9ODKqg25BUOXFgB5Dh3O7pJ2T359+aABy-WE-ioMnx1r9BSw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 6/7] vlan: Create 1.9 version
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
X-List-Received-Date: Mon, 17 Mar 2014 16:26:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Martin,

On Tue, Mar 11, 2014 at 11:17 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Mar 07, 2014 at 03:26:14PM -0600, Lauren Post wrote:
>> VLAN provides vconfig utility
>>
>> Signed-off-by: Lauren Post <lauren.post@freescale.com>
>> ---
>>  .../recipes-connectivity/vlan/vlan_1.9.bb          |   25 ++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>  create mode 100644 meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
>>
>> diff --git a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
>> new file mode 100644
>> index 0000000..a9711ed
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
>> @@ -0,0 +1,25 @@
>> +DESCRIPTION = "VLAN provides vconfig utility"
>
> DESCRIPTION -> SUMMARY
>
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://vconfig.c;md5=293ef69c4e88434d37a5ee577a5288cb"
>> +
>> +SRC_URI = "http://vlan.sourcearchive.com/downloads/1.9-3ubuntu9/vlan_1.9.orig.tar.gz"
>
> vlan -> ${BPN}
> 1.9 -> ${PV}
>
>> +
>> +SRC_URI[md5sum] = "5f0c6060b33956fb16e11a15467dd394"
>> +SRC_URI[sha256sum] = "3b8f0a1bf0d3642764e5f646e1f3bbc8b1eeec474a77392d9aeb4868842b4cca"
>> +
>> +S = "${WORKDIR}/vlan"
>
> vlan -> ${BPN}
>
>> +
>> +# comment out MakeInclude in Makefile which sets build environment
>> +do_configure_append () {
>> +    sed -i 's/^ include/#^include/' ${S}/Makefile
>> +}
>> +
>> +# ignore strip to avoid yocto errors in stripping
>> +do_compile () {
>> +    oe_runmake PLATFORM=ARM 'STRIP=echo' all
>> +}
>> +
>> +do_install () {
>> +     install -d ${D}/${exec_prefix}/bin
>> +     cp ${S}/vconfig ${D}/${exec_prefix}/bin
>
> 5 spaces -> 4 spaces
>
> I'll modify above comments when cherry-picking to master-next.

So I assume this one does not need a v2. Am I right?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

