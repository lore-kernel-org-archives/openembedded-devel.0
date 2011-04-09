Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q8cf2-0008Qp-Ni
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Apr 2011 20:13:28 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q8ccw-0006wC-TG from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Apr 2011 11:11:18 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Sat, 9 Apr 2011 11:11:18 -0700
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Sat, 9 Apr 2011 11:11:17 -0700
Message-ID: <4DA0A13A.1090406@mentor.com>
Date: Sat, 9 Apr 2011 11:11:06 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1301660208-31105-1-git-send-email-otavio@ossystems.com.br>	<1301660208-31105-3-git-send-email-otavio@ossystems.com.br>	<in4lhs$326$1@dough.gmane.org>	<AANLkTimRF7Q3=XeF1EOHgPNAGfJwnp5PmjHGyjUhTyef@mail.gmail.com>	<CC5D751E-FF84-40C2-B184-4C813C49F5E4@dominion.thruhere.net>	<AANLkTimS+CcrB7cHUF+ao=XwD0aXeFqt4r1N4erHoKFs@mail.gmail.com>	<1302330816.15056.15.camel@leto>	<1302340789.3131.7.camel@lenovo.internal.reciva.com>
	<BANLkTinKJf85aenJia6nrVBaOdANdM44oA@mail.gmail.com>
In-Reply-To: <BANLkTinKJf85aenJia6nrVBaOdANdM44oA@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 09 Apr 2011 18:11:18.0730 (UTC)
	FILETIME=[860D8AA0:01CBF6E1]
Subject: Re: [PATCH 3/6] xorg-xserver-common.inc: drop .la files from packages
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
X-List-Received-Date: Sat, 09 Apr 2011 18:13:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 04/09/2011 10:36 AM, Otavio Salvador wrote:
> On Sat, Apr 9, 2011 at 06:19, Phil Blundell <philb@gnu.org> wrote:
>> What would be the use case for having them there?  Nothing ever links
>> against them.  I think Otavio is right, they're better off deleted.
> 
> AFAIK .la files are used for in project linking not when linking with
> system or sdk libraries. So I'd prefer to remove them.

.la files have a defined purpose in a development area.  Until / unless
we move to globally killing .la files (see Richard talking about this on
the poky list a few weeks ago), we should ship these in the -dev
package.  If they're broken that probably means something isn't
inherit'ing the right class that should be fixing them.

-- 
Tom Rini
Mentor Graphics Corporation


