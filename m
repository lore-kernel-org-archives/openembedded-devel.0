Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id BFA7971CE7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jan 2017 21:59:55 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 75so1736341pgf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jan 2017 13:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=O2nmd2UH8G72qtr3zn/pJbOdwBd1mDC5+HQYqhfS77k=;
	b=g7/p0e6pdOLTtThEWNf8IyYhJ4oF8T0Bhp8aR/FERrSrv6ZQhGhyzsKFHro73+H5qP
	3cX4vDrheSivpy07386np/1nDkgZ5A/iOdzfG6YI9Xfhp6TfnwhMHeWCWocqMpJA37As
	JRj9h+oob7FfeOHSl8F1s38kusi75j9sGkMiGYSOkyT5kUex4eqqVVDdISBRAosdjNnx
	Dzs3Tng01E4c5T+DDjUR3lHkLYgxpaDqxHf/8U3Ju3k28Lhypc8WO0ho0scCu27OVJ+f
	Tex1+S7CIjPaRrrcdZcvrAyaQrGF5jQ9wrGhLiwVBdrms5Y9b2JuCtnVQcFCbnS20P99
	yB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=O2nmd2UH8G72qtr3zn/pJbOdwBd1mDC5+HQYqhfS77k=;
	b=QTbDKfj0NDW6w91dpp9qBVNGA3PaTwSlxKfoSS3FsuNSzRrwaA1xxmr2SE5XYrAvaC
	ufUR6Ph3LupUcrX5Zt7Yd2SQ8/oC0bqW85pc7HaAxoCU8sjewl2bQ5BlSfChUW226ZPY
	gKbslHkvt2Ia1srMKQ1rsbMKTuTFl4Fo+kg0u6RgaPSPNb/UMjaILjC6lCtQ85dLAaUe
	cFPwAdiyghBs3+96hnalTq+JfQH+CDakF5IJHxDpXJptHQjfcxqu0HGkRm7rzeSdM8Nl
	vWrxXMcE9irQE8/N5OAyhmSkV9dZ52WjqOD03mvSuMzQ9HtIME7MrOaY+XrWD8wWihBf
	Nfjg==
X-Gm-Message-State: AIkVDXL/tjAJ0SM89iobd7sd3qQNxrNDldE1FocE/2RZwG8DNlYAsGO6+5Dt3P/VMjWK7A==
X-Received: by 10.98.74.84 with SMTP id x81mr21810110pfa.172.1484431195475;
	Sat, 14 Jan 2017 13:59:55 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:b095:f6f4:2173:ada2])
	by smtp.gmail.com with ESMTPSA id
	c71sm37484175pga.22.2017.01.14.13.59.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Jan 2017 13:59:54 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <CAMjhiJiu5isiTgwjrQtigKrvY7NzgdB5bsrn8bbxXu8q7W=bKw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <7c171e1a-7151-6e6a-cfb9-7a06b9dec0df@gmail.com>
Date: Sat, 14 Jan 2017 13:59:53 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <CAMjhiJiu5isiTgwjrQtigKrvY7NzgdB5bsrn8bbxXu8q7W=bKw@mail.gmail.com>
Subject: Re: /usr merge, stateless systems and atomic updates w/ OpenEmbedded?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Jan 2017 21:59:57 -0000
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/14/17 11:45 AM, Leon Woestenberg wrote:
> Hello all,
> 
> more and more I am liking the approach taken by SuSE snapper (incremental
> but atomic updates using light-weight snapshots on BTRFS) and OSTree
> (incremental atomic updates using a GIT like approach on the source, bsdiff
> for delta updates).
> 
> These are targeting -- but also require -- systems that use the "/usr
> merge" approach, which is a bit controversial, but seems to fit many
> today's use cases; embedded, containers etc.
> 
> GNOME Continuous uses OpenEmbedded with OStree.
> Automotive Grade Linux has started to use Yocto with OSTree.
> 
> Looking back in the mailing lists, I have seen interest and activities in
> and around OpenEmbedded Core since 2013 to support /usr merge, but I am
> unaware of any upstream support for this, or distro's that implement it. Am
> I missing something?

I know archlinux based distros are already symlinking /bin and /lib
/sbin to their counterparts in /usr but I am not sure once you remove
these symlinks things will keep working as usual as there will be a set
of packages assuming these paths and so on.

> 
> Are there any developers here who do use OpenEmbedded with a /usr merge
> approach?
> 
> Regards,
> 
> Leon.
> 
> Some random links I came across:
> http://lists.openembedded.org/pipermail/openembedded-core/2014-December/099616.html
> https://patchwork.openembedded.org/patch/89069/
> http://lists.openembedded.org/pipermail/openembedded-core/2013-August/083595.html
> https://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge/
> https://patchwork.openembedded.org/patch/111129/
> 

