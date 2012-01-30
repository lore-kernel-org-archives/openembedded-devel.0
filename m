Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RrzQF-0007Bl-Id
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 23:09:59 +0100
Received: by eekd41 with SMTP id d41so1302864eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 14:02:06 -0800 (PST)
Received-SPF: pass (google.com: domain of tworaz666@gmail.com designates
	10.14.51.18 as permitted sender) client-ip=10.14.51.18; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of tworaz666@gmail.com
	designates 10.14.51.18 as permitted sender)
	smtp.mail=tworaz666@gmail.com;
	dkim=pass header.i=tworaz666@gmail.com
Received: from mr.google.com ([10.14.51.18])
	by 10.14.51.18 with SMTP id a18mr268011eec.39.1327960926242 (num_hops =
	1); Mon, 30 Jan 2012 14:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=xCp0ubSCaWLNG4DOZCq+w16uOEuRAZlVmyJRUmGUrvk=;
	b=fHong6k1xSxuIKSwxSdsJ9sGfEzNafHUOCwMV+G8HtdfwzxgvBPOt4pqHLYGIZYX0t
	UsfWvG7rZ2/bxsOqiLSJ5Mk8X1CD1XC6dWc9riLJr+sSKNCldGRnikrdjt4Cr2L9eRTI
	Q1+EDDNgaSytUX1dpSJga84aJSSSGflRaeJfU=
Received: by 10.14.51.18 with SMTP id a18mr189848eec.39.1327960925421;
	Mon, 30 Jan 2012 14:02:05 -0800 (PST)
Received: from [192.168.0.10] (89-77-50-243.dynamic.chello.pl. [89.77.50.243])
	by mx.google.com with ESMTPS id
	c16sm77868230eei.1.2012.01.30.14.02.04 (version=SSLv3 cipher=OTHER);
	Mon, 30 Jan 2012 14:02:04 -0800 (PST)
Message-ID: <4F2712E6.2000302@gmail.com>
Date: Mon, 30 Jan 2012 23:00:06 +0100
From: Peter Tworek <tworaz666@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20120112 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1327954536-29427-1-git-send-email-tworaz666@gmail.com>
	<CALbNGRRFydx6qqfMUCGrTzLsvAp5N+N8K4ox_fJMZUf6cRZtSg@mail.gmail.com>
In-Reply-To: <CALbNGRRFydx6qqfMUCGrTzLsvAp5N+N8K4ox_fJMZUf6cRZtSg@mail.gmail.com>
Subject: Re: [meta-xfce][PATCH] Add recipe for xarchiver 0.5.2.
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
X-List-Received-Date: Mon, 30 Jan 2012 22:10:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 01/30/2012 10:45 PM, Andreas Müller wrote:
> On Mon, Jan 30, 2012 at 9:15 PM, Peter Tworek<tworaz666@gmail.com>  wrote:
>> Run tested on netbookpro.
>>
>> Signed-off-by: Peter Tworek<tworaz666@gmail.com>
>> ---
>>   .../recipes-apps/xarchiver/xarchiver_0.5.2.bb      |   16 ++++++++++++++++
>>   1 files changed, 16 insertions(+), 0 deletions(-)
>>   create mode 100644 meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
>>
>> diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
>> new file mode 100644
>> index 0000000..b2e5fb6
>> --- /dev/null
>> +++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
>> @@ -0,0 +1,16 @@
>> +DESCRIPTION = "Lightweight desktop independent, GTK+ archive manager"
>> +HOMEPAGE = "http://xarchiver.sourceforge.net"
>> +SECTION = "x11"
>> +PR = "r0"
>> +
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>> +
>> +DEPENDS = "gtk+ glib-2.0 xfce4-dev-tools"
> Do you need xfce4-dev-tools on the target or isn't
> xfce4-dev-tools-native enough?
Quick tested it and yeah, xfce4-dev-tools-native is enough. There are 
just needed for do_configure. Do you need another patch?

/ptw

>
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



