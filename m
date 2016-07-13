Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 07DAF7317F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 15:50:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1468425011; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=Q3HuhjZ0rmZXaYLiiERMxITwyKZ5a60ujfmyzOnoRbg=;
	b=SZY3JqxYvqFwYbbC4sStQ3WVMTE1o1bRXCh5bpfDvIDCpn/gf83AuV2vpHoDUd2zk8jbICbL
	+EC4jBpfUBJvajcI2fKrKIpXh8caSplqP426SccaIQH68iadGolXIojSDxjQNhZ6wqpvtvoT
	nyPydkPMaE+ENaE9JZIRo+F9JXQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=ocA5qGX1IhBgyO6uLwvtN/VaIWoUbyo27c5GhFuV+a2aKQEbVyK4HtYRWb3oby0WIIZ0l4
	2RfdplYAri2ol3mpuVwv7Fl+WDJmRSs1SCj6z+XNWIMeRwDr4t+FZoARyjS6DkqSTwP00y4n
	MZ2wEi+i/jPn3mURnnueP+UXG9K9M=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mxa.mailgun.org with ESMTP id 57866331.7f65982d86f0-in01;
	Wed, 13 Jul 2016 15:50:09 -0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id h190so47551789ith.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 08:50:09 -0700 (PDT)
X-Gm-Message-State: ALyK8tLZlHU5ocEXhQ5WlNc0jYYW2F+6effUzM6isQJe2cqmr4Mn8VMpUV6p+5hb+9iIuG/CN11+RNng1Z2hKQ==
X-Received: by 10.36.60.148 with SMTP id m142mr8475996ita.96.1468425009324;
	Wed, 13 Jul 2016 08:50:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.213 with HTTP; Wed, 13 Jul 2016 08:50:08 -0700 (PDT)
In-Reply-To: <CADNbA1q33HHYm-52EZjFLE1beKLusD_rHTD4HJGiLP_5mAOvxw@mail.gmail.com>
References: <1468421827-11561-1-git-send-email-cynthia.ms.chiu@gmail.com>
	<CADNbA1q33HHYm-52EZjFLE1beKLusD_rHTD4HJGiLP_5mAOvxw@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Wed, 13 Jul 2016 11:50:08 -0400
X-Gmail-Original-Message-ID: <CADNbA1rUxG5LJb5VahaWFVkvfTM99N5Ba7VrxV9e5f_LnbXx9w@mail.gmail.com>
Message-ID: <CADNbA1rUxG5LJb5VahaWFVkvfTM99N5Ba7VrxV9e5f_LnbXx9w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] CANopenNode: recipe for building the CANopenSocket tools
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
X-List-Received-Date: Wed, 13 Jul 2016 15:50:11 -0000
Content-Type: text/plain; charset=UTF-8

Have you tried using the gitsm (
https://www.yoctoproject.org/docs/2.1/bitbake-user-manual/bitbake-user-manual.html#gitsm-fetcher)
fetcher instead of git?  I believe gitsm should do all of the submodule
init and update actions automatically rather than having to use a
do_compile_prepend.

-Derek


On Wed, Jul 13, 2016 at 10:57 AM, cynthiachiu <cynthia.ms.chiu@gmail.com>
> wrote:
>
>> Initial check-in for the CANopenSocket tools recipe.
>>
>> Signed-off-by: cynthiachiu <cynthia.ms.chiu@gmail.com>
>> ---
>>  .../canopennode/canopensocket_git.bb               | 31
>> ++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>  create mode 100644 meta-oe/recipes-extended/canopennode/
>> canopensocket_git.bb
>>
>> diff --git a/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
>> b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
>> new file mode 100644
>> index 0000000..4506698
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
>> @@ -0,0 +1,31 @@
>> +SUMMARY = "Linux CANOpen tools"
>> +DESCRIPTION = "Linux CANOpen Protocol Stack Tools"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM =
>> "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> +
>> +SRC_URI = "git://github.com/CANopenNode/CANopenSocket.git"
>> +SRCREV = "${AUTOREV}"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +do_compile_prepend() {
>> +    cd ${S}
>> +    git submodule init
>> +    git submodule update
>> +}
>> +
>> +do_compile() {
>> +    cd ${S}/canopend
>> +    make
>> +    cd ${S}/canopencomm
>> +    make
>> +    cd ${S}/canopencgi
>> +    make
>> +}
>> +
>> +do_install(){
>> +    install -d ${D}${bindir}
>> +    install -m 0755 ${S}/canopend/app/canopend ${D}${bindir}
>> +    install -m 0755 ${S}/canopencomm/canopencomm ${D}${bindir}
>> +    install -m 0755 ${S}/canopencgi/canopen.cgi ${D}${bindir}
>> +}
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

