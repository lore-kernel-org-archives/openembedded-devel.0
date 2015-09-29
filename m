Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 94C0E77025
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 11:50:52 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t8TBoqFr003926 for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 06:50:52 -0500
Received: from [10.113.0.102] ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015092906505233-705685 ;
	Tue, 29 Sep 2015 06:50:52 -0500 
To: openembedded-devel@lists.openembedded.org
References: <1443440681-5009-1-git-send-email-adrian.ratiu@ni.com>
	<1443521722-15792-1-git-send-email-adrian.ratiu@ni.com>
	<20150929112225.GA2400@jama>
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <560A7B1B.8030605@ni.com>
Date: Tue, 29 Sep 2015 14:50:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20150929112225.GA2400@jama>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/29/2015 06:50:52 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/29/2015 06:50:52 AM,
	Serialize complete at 09/29/2015 06:50:52 AM
X-Proofpoint-Virus-Version: vendor=nai engine=5600 definitions=5800
	signatures=585085
Subject: Re: [meta-oe][PATCH v2] vim: provide the xxd tool (package vim-xxd)
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
X-List-Received-Date: Tue, 29 Sep 2015 11:50:55 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=windows-1252; format=flowed

On 29.09.2015 14:22, Martin Jansa wrote:
> On Tue, Sep 29, 2015 at 01:15:22PM +0300, Ioan-Adrian Ratiu wrote:
>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> ---
>>   meta-oe/recipes-support/vim/vim_7.4.481.bb | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/vim/vim_7.4.481.bb b/meta-oe/recipes-support/vim/vim_7.4.481.bb
>> index 2ece53b..44e6571 100644
>> --- a/meta-oe/recipes-support/vim/vim_7.4.481.bb
>> +++ b/meta-oe/recipes-support/vim/vim_7.4.481.bb
>> @@ -76,11 +76,12 @@ do_install() {
>>
>>   PARALLEL_MAKEINST = ""
>>
>> -PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc"
>> +PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-xxd"
>>   FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
>>   FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
>>   FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
>>   FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
>> +FILES_${PN}-xxd = "${bindir}/xxd"
>
> So it was already included in some other package (probably main vim
> package)?

Yes, it is as you say, included in the main package.
If you think it's a good idea to leave it there, then we can simply 
ignore these patches.


