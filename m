Received: from [17.148.16.94] (helo=asmtpout019.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MG6ce-00018G-EJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Jun 2009 09:28:52 +0200
MIME-version: 1.0
Received: from [87.201.169.122] by asmtp019.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KL9008J1QYX0F20@asmtp019.mac.com> for
	openembedded-devel@lists.openembedded.org; Mon,
	15 Jun 2009 00:18:38 -0700 (PDT)
Message-id: <D661B752-90B3-4974-B31E-2B136D05B47F@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jun 2009 11:18:24 +0400
X-Mailer: Apple Mail (2.935.3)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: EmbeddedMicro <justin@embeddedmicro.com>
Subject: Help required to create recipe for FANN library
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
X-List-Received-Date: Mon, 15 Jun 2009 07:28:52 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi,
	Would someone be able to help us create an oe bitbake recipe for the  
Fast Artificial Neural Network Library ?

We have created an initial recipe, but the problem is don't know how  
to get this recipe to configure and install the library for the  
gumstix overo board.

If I look at the logs, nothing got configure or compiled when I look  
at the logs in the overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/ 
libfann-2.0.0-r01/tmp folder.

I've looked at a couple of recipes and it all looks the same, so can't  
figure out why this particular library is unable to get configured or  
built.

Any help would be much appreciated!

Best regards,

Elvis



# libfann-2.0.0 recipie
SECTION = "libs"
DEFAULT_PREFERENCE = "1"

# Package information
DESCRIPTION = "libfann, Fast Artificial Neural Network Library is a  
free open source neural network library, which implements multilayer  
artificial neural networks in C with support for both fully connected  
and sparsely connected networks."
LICENSE = "BSD"

PN = "libfann"
PV = "2.0.0"
PR = "r01"

SRC_URI = "http://prdownloads.sourceforge.net/fann/fann-${PV}.tar.bz2"

inherit autotools_stage pkgconfig

do_stage () {
	oe_libinstall -a -so -C lib libfann ${STAGING_LIBDIR}	
	install -d ${STAGING_INCDIR}/fann
	install -m 0644 src/include/vorbis/vorbisenc.h \
			src/include/vorbis/vorbisfile.h \
			src/include/vorbis/codec.h
			src/include/compat_time.h \
			src/include/config.h \
			src/include/doublefann.h \
			src/include/fann.h \
			src/include/fann_activation.h \
			src/include/fann_cascade.h \
			src/include/fann_data.h \
			src/include/fann_error.h \
			src/include/fann_internal.h \
			src/include/fann_io.h \
			src/include/fann_train.h \
			src/include/fixedfann.h \
			src/include/floatfann.h ${STAGING_INCDIR}/fann/
	install -d ${STAGING_DATADIR}/aclocal
	install -m 0644 aclocal.m4 ${STAGING_DATADIR}/aclocal/
}



