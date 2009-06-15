Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MG8uu-0006NV-Fi
	for openembedded-devel@openembedded.org; Mon, 15 Jun 2009 11:55:52 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MG8l0-0005UZ-Kh
	for openembedded-devel@openembedded.org; Mon, 15 Jun 2009 09:45:39 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 15 Jun 2009 09:45:38 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 15 Jun 2009 09:45:38 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 15 Jun 2009 11:45:27 +0200
Message-ID: <h1557n$fir$1@ger.gmane.org>
References: <D661B752-90B3-4974-B31E-2B136D05B47F@mac.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090604 Shredder/3.0b3pre
In-Reply-To: <D661B752-90B3-4974-B31E-2B136D05B47F@mac.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Help required to create recipe for FANN library
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
X-List-Received-Date: Mon, 15 Jun 2009 09:55:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-06-09 09:18, Elvis Dowson wrote:

> inherit autotools_stage pkgconfig
>
> do_stage () {
> oe_libinstall -a -so -C lib libfann ${STAGING_LIBDIR}
> install -d ${STAGING_INCDIR}/fann
> install -m 0644 src/include/vorbis/vorbisenc.h \
> src/include/vorbis/vorbisfile.h \
> src/include/vorbis/codec.h
> src/include/compat_time.h \
> src/include/config.h \
> src/include/doublefann.h \
> src/include/fann.h \
> src/include/fann_activation.h \
> src/include/fann_cascade.h \
> src/include/fann_data.h \
> src/include/fann_error.h \
> src/include/fann_internal.h \
> src/include/fann_io.h \
> src/include/fann_train.h \
> src/include/fixedfann.h \
> src/include/floatfann.h ${STAGING_INCDIR}/fann/
> install -d ${STAGING_DATADIR}/aclocal
> install -m 0644 aclocal.m4 ${STAGING_DATADIR}/aclocal/
> }

Why are you using autotools_stage if you're not going to use its staging 
method?



