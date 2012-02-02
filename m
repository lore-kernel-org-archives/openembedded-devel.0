Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1Rt2Lx-0005X5-5s
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Feb 2012 20:29:53 +0100
Received: by werc1 with SMTP id c1so2420042wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Feb 2012 11:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type;
	bh=ZxpWV7ZhiBiCcxUTUoilwwkbR+FgI+MLc+W0ftgxyhc=;
	b=aULoLGTwdSdZWEMlck2odEdd9PaaA9TMh4czxCizG30/8oXhlszfFV0/s9nPTiMKnN
	P0szvNjXcl09opU8zSayZByzI5Pd91Dnw1MlGtljrBrPiB77Tc7pbNyw/pFNhc0sr1Mj
	4A0gNcpPKxx8KRyTsFob5yvXsmPOzMuSnRKFQ=
Received: by 10.216.137.166 with SMTP id y38mr1683802wei.16.1328210516891;
	Thu, 02 Feb 2012 11:21:56 -0800 (PST)
Received: from [192.168.0.10] (89-77-50-243.dynamic.chello.pl. [89.77.50.243])
	by mx.google.com with ESMTPS id l8sm9918016wiy.5.2012.02.02.11.21.55
	(version=SSLv3 cipher=OTHER); Thu, 02 Feb 2012 11:21:56 -0800 (PST)
Message-ID: <4F2AE1DA.2060603@gmail.com>
Date: Thu, 02 Feb 2012 20:19:54 +0100
From: Peter Tworek <tworaz666@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20120112 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1328132338-15939-1-git-send-email-tworaz666@gmail.com>
	<1328171236.3941.4.camel@mattotaupa>
In-Reply-To: <1328171236.3941.4.camel@mattotaupa>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [meta-oe][PATCH] tmux: Add initial recipe for vesion 1.6.
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
X-List-Received-Date: Thu, 02 Feb 2012 19:29:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/02/2012 09:27 AM, Paul Menzel wrote:
> Dear Peter,
>
>
> thank you for your latest work. It is much appreciated.
You're welcome. Thanks for taking your time to review my patches.
>
> Am Mittwoch, den 01.02.2012, 22:38 +0100 schrieb Peter Tworek:
>
> This is just an optional request from me. I would like to see in the
> commit message what build configuration you used for testing.
No problem. Currently my main target is netbook pro.

>
>> Signed-off-by: Peter Tworek<tworaz666@gmail.com>
>> ---
>>   meta-oe/recipes-extended/tmux/tmux_1.6.bb |   18 ++++++++++++++++++
>>   1 files changed, 18 insertions(+), 0 deletions(-)
>>   create mode 100644 meta-oe/recipes-extended/tmux/tmux_1.6.bb
>>
>> diff --git a/meta-oe/recipes-extended/tmux/tmux_1.6.bb b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
>> new file mode 100644
>> index 0000000..eb6f7df
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
>> @@ -0,0 +1,18 @@
>> +DESCRIPTION = "Terminal multiplexer"
>> +HOMEPAGE = "http://tmux.sourceforge.net"
>> +SECTION = "console/utils"
>> +
>> +LICENSE = "ISC"
>> +LIC_FILES_CHKSUM = "file://tmux.c;startline=3;endline=17;md5=f36d9c9e6c1c24996a88891fdf783d04"
>> +
>> +DEPENDS = "ncurses libevent"
>> +
>> +SRC_URI = "${SOURCEFORGE_MIRROR}/tmux/${P}.tar.gz"
>> +SRC_URI[md5sum] = "3e37db24aa596bf108a0442a81c845b3"
>> +SRC_URI[sha256sum] = "faee08ba1bd8c22537cd5b7458881d1bdb4985df88ed6bc5967c56881a7efbd6"
>> +
>> +inherit autotools
>> +
>> +do_configure_prepend () {
>> +	sed -i -e 's:-I/usr/local/include::' Makefile.am || bb_fatal "sed failed"
> You can ensure that `sed` is available by depending on `sed-native` I
> think. At least in OE-Classic this was available.
I'll add it in v2. Thanks for pointing that one out.
>
> Additionally it would be great if you could contact upstream and make
> them aware of this problem and maybe even provide a patch. So that in
> the feature no adaptations are needed and other distributions/framework
> can profit too.
Sure, I'll do that. The fix itself is just for QA warning about 
including host headers.

>> +}
>
> Thanks,
>
> Paul
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


