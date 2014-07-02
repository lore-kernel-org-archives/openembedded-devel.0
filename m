Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A938C65DAF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jul 2014 09:52:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s629q7ex015083
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Jul 2014 02:52:07 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 2 Jul 2014 02:52:06 -0700
Message-ID: <53B3D645.2060402@windriver.com>
Date: Wed, 2 Jul 2014 17:52:05 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Himanshu Pandey <pandey_himanshu80@rediffmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1404287177.S.2799.28734.H.TlJvYmVydCBZYW5nAFJlOiBbYml0YmFrZS1kZXZlbF0gUmVnYXJkaW5nIE5ldC1Tbm1wIHBhY2thZ2U_.RU.rfs303,
	rfs303, 126,
	466.f4-234-161.old.1404294540.19150@webmail.rediffmail.com>
In-Reply-To: <1404287177.S.2799.28734.H.TlJvYmVydCBZYW5nAFJlOiBbYml0YmFrZS1kZXZlbF0gUmVnYXJkaW5nIE5ldC1Tbm1wIHBhY2thZ2U_.RU.rfs303,
	rfs303, 126,
	466.f4-234-161.old.1404294540.19150@webmail.rediffmail.com>
Subject: Re: [bitbake-devel] Regarding rp-pppoe package
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
X-List-Received-Date: Wed, 02 Jul 2014 09:52:07 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/02/2014 05:49 PM, Himanshu Pandey wrote:
> Hi,
>
> I am getting following error when I tried to add and compile rp-pppoe pacakage:
>

Please add the full error log, thanks.

Btw, I will go to have dinner now, may reply tomorrow.

// Robert

> ERROR: oe_runconf failed
>
> Please help.
>
> Regards,
> Himanshu
>
>
>
>
> From: Robert Yang <liezhi.yang@windriver.com>
> Sent: Wed, 02 Jul 2014 13:16:17
> To: Himanshu Pandey <pandey_himanshu80@rediffmail.com>
> Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
> Subject: Re: [bitbake-devel] Regarding Net-Snmp package
>
> I think that this email should go into oe-devel (see the cc) since
> the net-snmp is from the meta-networking layer, please see:
>
> meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
>
> PACKAGES = "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-static ${PN}-libs \
>              ${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd
> ${PN}-server-snmptrapd"
>
> There is no net-snmp in the PACKAGES, I think that you need use
> net-snmp-client or net-snmp-server.
>
> // Robert
>
>
>
>
> On 07/02/2014 03:36 PM, Himanshu Pandey wrote:
>  > Hi,
>  >
>  > I am getting following errors:
>  >
>  > Error: net-snmp not found in the base feeds (genericx86_64 x86_64 noarch any
> all).
>  >
>  > sed: can't read
>  >
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/net-snmp/5.7.2-r1/image/usr/bin/net-snmp-config:
>  > No such file or directory
>  >
>  > Please help.
>  >
>  > Regards,
>  > Himanshu
>  >
>  >
>  >
> <http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?>
>  > Get your own *FREE* website, *FREE* domain & *FREE* mobile app with Company
> email.
>  >    *Know More >*
>  >
> <http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&cmp=host&lnk=sign-1-10-13&nsrv1=host>
>  >
>  >
>  >
>
> <http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?>
> Get your own *FREE* website, *FREE* domain & *FREE* mobile app with Company email.
> 	*Know More >*
> <http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&cmp=host&lnk=sign-1-10-13&nsrv1=host>
>

