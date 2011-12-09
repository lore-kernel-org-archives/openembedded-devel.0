Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RZ5jx-0005mg-C7
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 20:04:13 +0100
Received: by wgbds11 with SMTP id ds11so5346779wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 10:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=dG9/Nf08/D0Pn3nsGZ0weshgwGJ8t2WmeoFR7dgGiXo=;
	b=HkKmInMn3mEf9FzIGQUR1T3vNAQA4j+SWKczb9+CLXg+5DvWKIj+/21Hc4ZDICb6vL
	Dple6ds3lIMvad4P7OVZz1xS5ZAF3Lqt8dtmtm+2W+m6/xMxnmApTDJy//ctbc28AEMJ
	8WJ0YM6z/S76Y6DXPXcoftC9za1wFGtT4X7N8=
Received: by 10.216.220.231 with SMTP id o81mr39674wep.41.1323457042253;
	Fri, 09 Dec 2011 10:57:22 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id 28sm13404826wby.3.2011.12.09.10.57.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 10:57:20 -0800 (PST)
Message-ID: <4EE25A0B.7070309@googlemail.com>
Date: Fri, 09 Dec 2011 18:57:15 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4EE17931.7000609@googlemail.com>	<CABcZANn76DwH5QPkZw_zPVBHxS0F3a-7YgKebU3Hd=+CtZd+eQ@mail.gmail.com>	<4EE20646.2030300@googlemail.com>	<jbt2rc$l31$1@dough.gmane.org>
	<4EE2305B.5030407@googlemail.com> <4EE23411.2060907@windriver.com>
In-Reply-To: <4EE23411.2060907@windriver.com>
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
X-List-Received-Date: Fri, 09 Dec 2011 19:04:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


> The creation of the filesystem image is driven by a number of 
> components. Basically it works like this:
Thanks a lot for that - a good insight into the workings of oe and 
bitbake. I was hoping there would be an easier way to configure/change 
this to what I want, but I see that it is much more complex than I 
thought initially.

> I have a spreadsheet (OpenOffice 17k, or Excel 81k) that lists all of 
> the current breakdowns.  If you are interested send me an email off list.
I am interested (excel would be nice, thanks), but don't know your email 
address (all I get when responding to 'all' is the mailing list email 
address) - if you know mine, you could send me that and I'll have a look.

I take it there isn't an easy way to see the hierarchy of all 
packages/dependencies involved in a particular image, is it (your 
spreadsheet may be good, but I suppose it is static and reflects just a 
current snapshot of a given packages/dependencies and that might change)?

If all else fails, I might use ipkg on the target system to uninstall 
the packages I don't need and install new ones - not ideal by any means, 
but this is what I'll do only as a last resort, if all else fails. 
Thanks again for the thorough response!



