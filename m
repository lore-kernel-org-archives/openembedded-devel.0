Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PxhS3-0001lc-Tb
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 16:06:56 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PxhQX-00028J-34 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 07:05:21 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 10 Mar 2011 07:04:43 -0800
Received: from [172.30.80.238] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Thu, 10 Mar 2011 07:04:43 -0800
Message-ID: <4D78E882.5040307@mentor.com>
Date: Thu, 10 Mar 2011 08:04:34 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1299768051.3853.21.camel@mattotaupa>
In-Reply-To: <1299768051.3853.21.camel@mattotaupa>
X-OriginalArrivalTime: 10 Mar 2011 15:04:43.0836 (UTC)
	FILETIME=[7CFBC7C0:01CBDF34]
Subject: Re: help2man-native: task configure fails with `configure: error: perl module Locale::gettext required`
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
X-List-Received-Date: Thu, 10 Mar 2011 15:06:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2011 07:40 AM, Paul Menzel wrote:
> Dear OE folks,
>
>
> some recent commit indirectly seems to have broken `help2man-native` and
> task configure fails.
>
>      checking whether gcc accepts -g... yes
>      checking for gcc option to accept ISO C89... none needed
>      checking for library containing dlsym... -ldl
>      checking for library containing bindtextdomain... none required
>      configure: error: perl module Locale::gettext required
>
> Adding `liblocale-gettext-perl-native` to `DEPENDS_virtclass-native`
> does not fix the problem but causes a dependency loop.
>
> I do not understand the dependency for the native package anyway.
>
>          DEPENDS = "gettext-native perl-native liblocale-gettext-perl-native"
>          DEPENDS_virtclass-native = "perl-native autoconf-native automake-native"
>          RDEPENDS_${PN} = "gettext perl liblocale-gettext-perl"
>          RDEPENDS_${PN}_virtclass-native = ""
>
> I though that `DEPENDS_virtclass-native` has `DEPENDS` as a subset
> automatically.
>
> Any ideas?

Is this a uclibc target perhaps?

-- 
Tom Rini
Mentor Graphics Corporation


