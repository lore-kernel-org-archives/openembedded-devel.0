Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MHMIZ-00037e-AQ
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 20:25:19 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MHM8M-0000hf-AJ
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 18:14:46 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 18:14:46 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 18:14:46 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 18 Jun 2009 20:14:34 +0200
Message-ID: <h1e06a$9ja$1@ger.gmane.org>
References: <C960916A-B754-4AD4-9751-67D7025AC8C1@mac.com>	<h19s8q$jd7$1@ger.gmane.org>	<4593EC5C-D89E-4947-AA92-3AD423A196B5@mac.com>	<h1dr55$nue$1@ger.gmane.org>
	<4A3A82F6.1010306@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090604 Shredder/3.0b3pre
In-Reply-To: <4A3A82F6.1010306@balister.org>
Sender: news <news@ger.gmane.org>
Subject: Re: Patch for libfann-2.0.0 recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Jun 2009 18:25:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18-06-09 20:09, Philip Balister wrote:
> Koen Kooi wrote:
>> On 18-06-09 18:05, Elvis Dowson wrote:
>>> Hi Rolf,
>>>
>>> On Jun 17, 2009, at 8:43 AM, Rolf Leggewie wrote:
>>>
>>>> Can you please take a look at
>>>> http://wiki.openembedded.net/index.php/Styleguide and reorder the
>>>> fields accordingly? I think there is also a script in the contrib
>>>> directory to help with this.
>>>
>>> Here is the modified recipe: recipes/libfann/libfann-2.0.0.bb
>>>
>>> DESCRIPTION = "Fast Artificial Neural Network Library"
>>> HOMEPAGE = "http://leenissen.dk/fann/"
>>> SECTION = "libs"
>>> LICENSE = "BSD"
>>> SRCDATE = "20090618"
>>> PV = "2.0.0"
>>
>>> PR = "r01"
>>
>> Don't set PR to that.
>>
>>> SRC_URI = "http://prdownloads.sourceforge.net/fann/fann-${PV}.tar.bz2"
>>>
>>> S = "${WORKDIR}/fann-${PV}"
>>>
>>> inherit autotools pkgconfig
>>
>> use AUTOTOOLS_STAGE_PKGCONFIG = "1"
>>
>>> do_stage () {
>>> oe_libinstall -a -so -C src libfann ${STAGING_LIBDIR}
>>> install -d ${STAGING_INCDIR}/fann
>>> (cd ${S}/src/include; cp compat_time.h config.h doublefann.h fann.h
>>> fann_activation.h fann_cascade.h fann_data.h fann_error.h
>>> fann_internal.h fann_io.h fann_train.h fixedfann.h floatfann.h
>>> ${STAGING_INCDIR}/fann/)
>>> install -m 0644 ${S}/aclocal.m4 ${STAGING_DATADIR}/aclocal/
>>> }
>>
>> Again, don't use custom staging methods for silly reasons.
>
> I don't think the reason here is silly. I checked on my Fedora box and
> it installs the headers in include/fann/*.h also. The headers may need
> installing here so we can avoid patching existing software. I'm not
> intimately familiar with fann, so it would be great if people who are
> could look at this.

I think the fann authors know best where to install their to, which 
means using autotools_stage_all.

regards,

Koen



