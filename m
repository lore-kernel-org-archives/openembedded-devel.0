Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MGda3-0006sm-UF
	for openembedded-devel@openembedded.org; Tue, 16 Jun 2009 20:40:24 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MGdQ2-0006xP-FJ
	for openembedded-devel@openembedded.org; Tue, 16 Jun 2009 18:30:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 16 Jun 2009 18:30:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 16 Jun 2009 18:30:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 16 Jun 2009 20:27:35 +0200
Message-ID: <h18o6n$oos$2@ger.gmane.org>
References: <C960916A-B754-4AD4-9751-67D7025AC8C1@mac.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090604 Shredder/3.0b3pre
In-Reply-To: <C960916A-B754-4AD4-9751-67D7025AC8C1@mac.com>
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
X-List-Received-Date: Tue, 16 Jun 2009 18:40:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-06-09 19:14, Elvis Dowson wrote:
> Hi,
> I'm attaching a patch for the libfann-2.0.0 recipe for inclusion into
> the oe repository.
>
> Best regards,
>
> Elvis
>
>  From edb273d68849fd968f83a0bf59efba120b578fa3 Mon Sep 17 00:00:00 2001
> From: Elvis Dowson <elvis.dowson@gmail.com>
> Date: Tue, 16 Jun 2009 21:12:52 +0400
> Subject: [PATCH] Added libfann-2.0.0 recipe
>
> ---
> conf/checksums.ini | 4 ++++
> recipes/libfann/libfann_2.0.0.bb | 23 +++++++++++++++++++++++
> 2 files changed, 27 insertions(+), 0 deletions(-)
> create mode 100644 recipes/libfann/libfann_2.0.0.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 37d55c7..7c38ea9 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -286,6 +286,10 @@
> sha256=1f8504c7f08d2d59c71a70915fc834a285b99587444ee33e23ee3f135c071da0
> md5=a8cf945d09c6458cb27228218e9a2f45
> sha256=8416e162d6fc921f14a61c8905e9f9a28dc25e67e1c71b75574360a13f0c28c7
>
> +[http://prdownloads.sourceforge.net/fann/fann-2.0.0.tar.bz2]
> +md5=4224efa533265dcf39237667973d0e20
> +sha256=762a1313a9b935300cb66ebf052d469d04823ca721fe6dd2a49c01e13e8ab30a
> +
> [http://downloads.sourceforge.net/fordiac/FORTE-0.3.5.zip]
> md5=d207d3b389ee9f2702df095681459f99
> sha256=2b87b331e931db2db07408c1b07bdb557227e0c16f8fe37f72e40b08fca0a09c
> diff --git a/recipes/libfann/libfann_2.0.0.bb
> b/recipes/libfann/libfann_2.0.0.bb
> new file mode 100644
> index 0000000..d3166ec
> --- /dev/null
> +++ b/recipes/libfann/libfann_2.0.0.bb
> @@ -0,0 +1,23 @@
> +# libfann-2.0.0 recipie
> +SECTION = "libs"
> +DEFAULT_PREFERENCE = "1"
> +
> +# Package information
> +DESCRIPTION = "libfann, Fast Artificial Neural Network Library is a
> free open source neural network library, which implements multilayer
> artificial neural networks in C with support for both fully connected
> and sparsely connected networks."
> +LICENSE = "BSD"
> +PN = "libfann"
> +PV = "2.0.0"
> +PR = "r01"
> +
> +SRC_URI = "http://prdownloads.sourceforge.net/fann/fann-${PV}.tar.bz2"
> +
> +S = "${WORKDIR}/fann-${PV}"
> +
> +inherit autotools pkgconfig
> +
> +do_stage () {
> + oe_libinstall -a -so -C src libfann ${STAGING_LIBDIR}
> + install -d ${STAGING_INCDIR}/fann
> + (cd ${S}/src/include; cp compat_time.h config.h doublefann.h fann.h
> fann_activation.h fann_cascade.h fann_data.h fann_error.h
> fann_internal.h fann_io.h fann_train.h fixedfann.h floatfann.h
> ${STAGING_INCDIR}/fann/)
> + install -m 0644 ${S}/aclocal.m4 ${STAGING_DATADIR}/aclocal/
> +}

Can't you use autotools_stage to stage all this? And if not, don't use 
'cp', but 'install'.

regards,

Koen



