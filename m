Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 362CA65C8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 12:40:21 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t9DCeLVg005789 for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 07:40:21 -0500
Received: from [10.113.0.102] ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015101307402142-1798431 ;
	Tue, 13 Oct 2015 07:40:21 -0500 
To: openembedded-devel@lists.openembedded.org
References: <1443597600-29477-1-git-send-email-adrian.ratiu@ni.com>
	<1444373887-24315-1-git-send-email-adrian.ratiu@ni.com>
	<20151013105339.GC2396@jama>
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <561CFBB4.4000404@ni.com>
Date: Tue, 13 Oct 2015 15:40:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151013105339.GC2396@jama>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 10/13/2015 07:40:21 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 10/13/2015 07:40:21 AM,
	Serialize complete at 10/13/2015 07:40:21 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-10-13_12:, , signatures=0
Subject: Re: [meta-oe][PATCH v2] meta-oe: recipes-graphics: add libvncserver recipe
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
X-List-Received-Date: Tue, 13 Oct 2015 12:40:22 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=windows-1252; format=flowed

On 13.10.2015 13:53, Martin Jansa wrote:
> On Fri, Oct 09, 2015 at 09:58:07AM +0300, Ioan-Adrian Ratiu wrote:
>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> ---
>>   .../libvncserver/libvncserver_0.9.10.bb               | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>   create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
>>
>> diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
>> new file mode 100644
>> index 0000000..afa303c
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
>> @@ -0,0 +1,19 @@
>> +DESCRIPTION = "library for easy implementation of a RDP/VNC server"
>> +HOMEPAGE = "https://libvnc.github.io"
>> +SECTION = "libs"
>> +PRIORITY = "optional"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
>> +
>> +DEPENDS += "zlib jpeg libpng gtk+ libgcrypt nettle gnutls gmp"
>> +RDEPENDS_${PN} += "libpng gtk+ libgcrypt"
>> +
>> +RCONFLICTS_${PN} = "x11vnc"
>
> This isn't enough to resolve conflicts with x11vnc in sysroot, this only
> prevent installing both packages in the same image.
>
>> +
>> +inherit autotools pkgconfig
>> +
>> +SRC_URI  = "git://github.com/LibVNC/libvncserver.git;tag=LibVNCServer-0.9.10"
>
> Set SRCREV matching with this tag, otherwise bitbake will always use git
> ls-remote to convert tag name to git SHA, which won't work for builds
> from premirror (possibly without access to network)
>

This is easy to fix, however the above x11vnc conflict is not and I have 
to check with upstream developers which might take awhile.

Is it ok to blacklist libvncserver in patch v3 in order to not break 
x11vnc until this is solved?

>> +
>> +S = "${WORKDIR}/git"
>> +
>> +EXTRA_OEMAKE_append=" SUBDIRS='libvncserver' "
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>


