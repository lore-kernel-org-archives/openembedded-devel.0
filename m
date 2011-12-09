Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RZ7RH-0001ck-Rh
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 21:53:03 +0100
Received: by faaa20 with SMTP id a20so1079843faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 12:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=4TOpYjd0wO4ibrliGY19isWnSG07jh08oY8x7Y2JeHI=;
	b=M7nfsdKzSQ+h56ZtOcjMwxKODVoeAv3Ogh5VxNbccLE4ab6RtrTLENPP4frcLGN1nX
	HALzRzYAn3y1rMwrdmZl2j5dk7vkIuOe8osLm4WVeVqvkvTmm/638YBoE6eibBBfrvE5
	1nPvpRVIqMfocBLwHSJV1BtYcONApZ3k1wZWc=
Received: by 10.180.6.71 with SMTP id y7mr12041837wiy.67.1323463572792;
	Fri, 09 Dec 2011 12:46:12 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id p2sm906006wbh.22.2011.12.09.12.46.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 12:46:11 -0800 (PST)
Message-ID: <4EE2738E.4060902@googlemail.com>
Date: Fri, 09 Dec 2011 20:46:06 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4EE17931.7000609@googlemail.com>	<CABcZANn76DwH5QPkZw_zPVBHxS0F3a-7YgKebU3Hd=+CtZd+eQ@mail.gmail.com>	<4EE20646.2030300@googlemail.com>	<jbt2rc$l31$1@dough.gmane.org>	<4EE2305B.5030407@googlemail.com>
	<4EE23411.2060907@windriver.com>	<4EE25A0B.7070309@googlemail.com>
	<4EE26C16.8040707@windriver.com>
In-Reply-To: <4EE26C16.8040707@windriver.com>
Subject: Re: packages versioning
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
X-List-Received-Date: Fri, 09 Dec 2011 20:53:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


> Ya, I created the spreadsheet due to the complexity.. :(  I like the 
> flexibility of the components that are used to construct the image 
> packages, but there has to be a more transparent way of doing this.
I concur. I am starting to like oe and its flexibility, but it is a hell 
of a steep curve at first to take on...particularly for people like me 
that have little-to-no experience of oe.

> (Sent as a private email)
Got it, thanks a lot - will look at it tomorrow in more detail.

> As Gary suggested in another email, "hob" is the best approach right now.
I'll try that as well - it would be nice to see where all these 
dependencies/packages come from, because for my (admittedly, rather 
limited) case I won't need half the packages installed on that image, 
but OTOH would need to add a few additions of my own to what is already 
'included', so it is quite a change. I also plan to create one or two 
new recipes for packages worth including (particularly for small systems 
like the console image I am trying to build).

What is the policy of submitting patches on here - I followed the debate 
about oe-classic/oe-core, but am still unclear if I want to submit 
patches (I am working with oe-classic - so I am told) what should I base 
against these?

> You can certainly remove binary packages after the fact, but it's much 
> nicer to not have to.
Indeed and it is the reason for asking here first as I always believe 
there must be more intelligent and elegant solution to this than hacking 
the target system (which I'll have to do each time I 
build/update/upgrade that image).



