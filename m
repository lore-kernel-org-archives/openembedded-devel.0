Return-Path: <paul.betafive@gmail.com>
Received: from mail-vb0-f45.google.com (mail-vb0-f45.google.com
	[209.85.212.45])
	by mail.openembedded.org (Postfix) with ESMTP id B3EA26E7F5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 11:43:10 +0000 (UTC)
Received: by mail-vb0-f45.google.com with SMTP id m10so5661133vbh.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 03:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=KQEsGPNTr7eCZAnAO+zUfAWyXIacAoakNRV0Qoc2P+g=;
	b=VPTEckqzzm+q2lcbUEximr3rA5cuDUIXpke9itmPIRQ/bMhjKGVCz054Q+j7Q4Qy12
	rDSh5XSL/ij/Az2d0rN07U6sD2+pzgY31WWaXa+VLjUQ7qsq7up9YlwhsaGWZT7wxjxe
	oz3PhsdxvenirkvMR3B9ndEKRaDdxVK2hL6xZW8417wK/z2JurjJ8R/U1APAI1O8/3uW
	dXNFFC3A0jYx9/sQxMJbVccXPzRqAXmZFS2eldZklhQOCyJz4MZ4F76KDjSHNCzSHb1G
	p0hFCG5DBEKsWp1OONsZhtFeBvKYahFLg3i8RC4q0qpiLkWG92OV4uySiQIsgfQMVzFW
	M3Wg==
X-Received: by 10.52.230.105 with SMTP id sx9mr23803896vdc.10.1392118991177;
	Tue, 11 Feb 2014 03:43:11 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Tue, 11 Feb 2014 03:42:31 -0800 (PST)
In-Reply-To: <CANR6C55tvGxPN1DsJaupK53Z4HdWM=Zi5X8L7ZXM9k5FRH2LWQ@mail.gmail.com>
References: <CANR6C54WmokZxiFHThuXkZ-kiocewgnGVg7AtbH=FHjr1AFHsg@mail.gmail.com>
	<CANR6C56W7g63xx1D5WOA40YL8B_5j-q=uwt6VgFPW72eNZ=k7Q@mail.gmail.com>
	<CANyK_8eseDidQWN6tfCFXF3dXy6pQMH0uSCSyGAHDJfE_zfwzw@mail.gmail.com>
	<CANR6C55tvGxPN1DsJaupK53Z4HdWM=Zi5X8L7ZXM9k5FRH2LWQ@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 11 Feb 2014 11:42:31 +0000
X-Google-Sender-Auth: YJEKzQ5sbEy8LVQoWWZeCk--BSw
Message-ID: <CANyK_8cKnc87R3AGRy1MpNJB9hbPhq1qr4LL5TdNWuBCZ55=+Q@mail.gmail.com>
To: "Nick D'Ademo" <nickdademo@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: tk 8.6.0: strange error: "oe_runmake: command not found"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Feb 2014 11:43:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 7 February 2014 13:53, Nick D'Ademo <nickdademo@gmail.com> wrote:
> Thanks Paul.
>
> The run log has oe_runmake called via:
>
>> autotools_do_install() {
>>     oe_runmake
>> 'DESTDIR=/home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image'
>> install
>>     # Info dir listing isn't interesting at this point so remove it if it
>> exists.
>>     if [ -e
>> "/home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image/usr/share/info/dir"
>> ]; then
>>         rm -f
>> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image/usr/share/info/dir
>>     fi
>>
>> }
>

You should see the definition of oe_runmake() in the run file itself,
possibly after the autotools_do_install() function. That run file
should include everything that is needed. Could you confirm that is
there, maybe post the whole run file for further investigation?

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

