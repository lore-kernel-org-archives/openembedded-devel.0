Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1TWGUS-0001r4-3U
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Nov 2012 02:01:04 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qA80lCIR027961
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Nov 2012 16:47:15 -0800 (PST)
Received: from [128.224.162.143] (128.224.162.143) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Wed, 7 Nov 2012 16:47:11 -0800
Message-ID: <509B010D.70900@windriver.com>
Date: Thu, 8 Nov 2012 08:47:09 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1352267865-3534-1-git-send-email-rongqing.li@windriver.com>
	<CABcZANkL_-7p38JMu4wQJBXwmYpYL0FWUKBAn3MyBzmzpg3BhA@mail.gmail.com>
In-Reply-To: <CABcZANkL_-7p38JMu4wQJBXwmYpYL0FWUKBAn3MyBzmzpg3BhA@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	qA80lCIR027961
Cc: Chris Larson <clarson@kergoth.com>
Subject: Re: [PATCH] Apache2: Add libselinux dependency and Disable parallel install
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
X-List-Received-Date: Thu, 08 Nov 2012 01:01:04 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 2012=E5=B9=B411=E6=9C=8808=E6=97=A5 00:46, Chris Larson wrote:
> On Tue, Nov 6, 2012 at 10:57 PM, <rongqing.li@windriver.com> wrote:
>
>> 2. Disable parallel make install
>> apache2 supports parallel make install, before installation,
>> it will firstly call build/mkdir.sh to create needed directories.
>> build/mkdir.sh first checks if a directory exists or not, if not,
>> it will create this directory, when mkdir.sh is called by many
>> instances parallel, it will introduce race, namely the result of
>> checking says one directory does not exist, but when it tries to
>> mkdir, this directory has been created by other instance.
>>
>
> How much work would it be to change it to run 'mkdir -p' rather than
> build/mkdir.sh, e.g. via a variable in EXTRA_OEMAKE?
>

"mkdir -p", plus ignoring return result of mkdir should be worked, but
it can not be passed in by variable in EXTRA_OEMAKE, maybe need a patch.

Since this bug is hard to reproduce, so I simply disable the parallel
install.

--=20
Best Reagrds,
Roy | RongQing Li




