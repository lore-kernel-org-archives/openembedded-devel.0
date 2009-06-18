Received: from [17.148.16.97] (helo=asmtpout022.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MHKIL-0008Ik-Ts
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 18:16:58 +0200
MIME-version: 1.0
Received: from [87.201.169.51] by asmtp022.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLF00F2AZE64R50@asmtp022.mac.com> for
	openembedded-devel@openembedded.org;
	Thu, 18 Jun 2009 09:06:14 -0700 (PDT)
Message-id: <4593EC5C-D89E-4947-AA92-3AD423A196B5@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: Rolf Leggewie <no2spam@nospam.arcornews.de>
In-reply-to: <h19s8q$jd7$1@ger.gmane.org>
Date: Thu, 18 Jun 2009 20:05:55 +0400
References: <C960916A-B754-4AD4-9751-67D7025AC8C1@mac.com>
	<h19s8q$jd7$1@ger.gmane.org>
X-Mailer: Apple Mail (2.935.3)
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Thu, 18 Jun 2009 16:16:58 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi Rolf,

On Jun 17, 2009, at 8:43 AM, Rolf Leggewie wrote:

> Can you please take a look at http://wiki.openembedded.net/index.php/Styleguide 
>  and reorder the fields accordingly?  I think there is also a script  
> in the contrib directory to help with this.

Here is the modified recipe: recipes/libfann/libfann-2.0.0.bb

DESCRIPTION = "Fast Artificial Neural Network Library"
HOMEPAGE = "http://leenissen.dk/fann/"
SECTION = "libs"
LICENSE = "BSD"
SRCDATE = "20090618"
PV = "2.0.0"
PR = "r01"

SRC_URI = "http://prdownloads.sourceforge.net/fann/fann-${PV}.tar.bz2"

S = "${WORKDIR}/fann-${PV}"

inherit autotools pkgconfig

do_stage () {
	oe_libinstall -a -so -C src libfann ${STAGING_LIBDIR}
	install -d ${STAGING_INCDIR}/fann
	(cd ${S}/src/include; cp compat_time.h config.h doublefann.h fann.h  
fann_activation.h fann_cascade.h fann_data.h fann_error.h  
fann_internal.h fann_io.h fann_train.h fixedfann.h floatfann.h $ 
{STAGING_INCDIR}/fann/)
	install -m 0644 ${S}/aclocal.m4 ${STAGING_DATADIR}/aclocal/
}


Best regards,

Elvis


