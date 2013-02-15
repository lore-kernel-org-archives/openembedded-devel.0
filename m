Received: from mail-ie0-f176.google.com ([209.85.223.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U6QN0-0000zQ-Sw
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2013 19:50:51 +0100
Received: by mail-ie0-f176.google.com with SMTP id k13so5143826iea.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2013 10:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=loJ7mc6zynXzLj76Y5tu1BDkP/yBZw7Jxg+hYylgfSc=;
	b=NR90Nctsq91L50HXUUWAcitTjirYJNDlA99Rpd/JfRakJWqFA7XBIbXiO0XcOhIa08
	j5qzGmUIC1omWDhbSciUc9RjYzz8m50tHV/cff0C9jWz2ZtVrGXp2vJLfYiIHEkcybQo
	+0nAYIWa6/qIyUR1nbfElztMQXfE1XkE2fziEXCXN4Vq8tklrCK5VGNqS6QmarSoyd0i
	SL+RG/38kLeIHl0ZX20L5Ta5FPLQTyk4bG7uotrJ3RFFs1Sy3/N+6PwfQTJAHdR9DN6C
	El8mktIzMC5ZIAXP8kSsFcjgid5QNguNoNTAqU2SDlwwLeCqGXBUH5oN3eckEARcJsQQ
	UMzA==
X-Received: by 10.50.56.141 with SMTP id a13mr2664728igq.24.1360953286447;
	Fri, 15 Feb 2013 10:34:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.13.204 with HTTP; Fri, 15 Feb 2013 10:34:16 -0800 (PST)
In-Reply-To: <20130214030133.GG3300@jama>
References: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
	<1360776335-21633-2-git-send-email-raj.khem@gmail.com>
	<20130214030133.GG3300@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Feb 2013 10:34:16 -0800
Message-ID: <CAMKF1sqo9-in8QYXyQK-jWdQ75zRrY35v+DRA84EyVBtDTdsFQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd][PATCH 2/2] meta-systemd: Append ${PN} to SYSTEMD_SERVICE
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
X-List-Received-Date: Fri, 15 Feb 2013 18:50:52 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 13, 2013 at 7:01 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> -SYSTEMD_PACKAGES = "${PN}-systemd"
>> -SYSTEMD_SERVICE = "entrance.service"
>> +RPROVIDES_${PN} += "${PN}"
>
> This one looks incorrect.

yes indeed. I have send a V2 with this corrected.


