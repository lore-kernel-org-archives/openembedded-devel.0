Received: from [17.148.16.95] (helo=asmtpout020.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MG9sy-0004kC-R2
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Jun 2009 12:57:57 +0200
MIME-version: 1.0
Received: from [87.201.169.122] by asmtp020.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLA00B460NDWX20@asmtp020.mac.com> for
	openembedded-devel@lists.openembedded.org; Mon,
	15 Jun 2009 03:47:42 -0700 (PDT)
Message-id: <A333C385-1DED-40D9-AD9E-08DF830A732E@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
In-reply-to: <h1557n$fir$1@ger.gmane.org>
Date: Mon, 15 Jun 2009 14:47:27 +0400
References: <D661B752-90B3-4974-B31E-2B136D05B47F@mac.com>
	<h1557n$fir$1@ger.gmane.org>
X-Mailer: Apple Mail (2.935.3)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Mon, 15 Jun 2009 10:57:57 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi Koen,
		
On Jun 15, 2009, at 1:45 PM, Koen Kooi wrote:

> On 15-06-09 09:18, Elvis Dowson wrote:
>
>> inherit autotools_stage pkgconfig
>>
>> do_stage () {
>> oe_libinstall -a -so -C lib libfann ${STAGING_LIBDIR}
>> install -d ${STAGING_INCDIR}/fann
>> install -m 0644 src/include/vorbis/vorbisenc.h \
>> src/include/vorbis/vorbisfile.h \
>> src/include/vorbis/codec.h
>> src/include/compat_time.h \
>> src/include/config.h \
>> src/include/doublefann.h \
>> src/include/fann.h \
>> src/include/fann_activation.h \
>> src/include/fann_cascade.h \
>> src/include/fann_data.h \
>> src/include/fann_error.h \
>> src/include/fann_internal.h \
>> src/include/fann_io.h \
>> src/include/fann_train.h \
>> src/include/fixedfann.h \
>> src/include/floatfann.h ${STAGING_INCDIR}/fann/
>> install -d ${STAGING_DATADIR}/aclocal
>> install -m 0644 aclocal.m4 ${STAGING_DATADIR}/aclocal/
>> }
>
> Why are you using autotools_stage if you're not going to use its  
> staging method?
>

I don't know these command. Could you help me correct this recipe?

Best regards,

Elvis

