Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1FA65600BC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Oct 2017 22:49:20 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id i124so31132908wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Oct 2017 15:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=wDT/MLZIHd6AUHRDvjcf9jVmvH1PUl18hD/AfpIO+TI=;
	b=b9AeBXG3zro9EuizrCoIe+KGKp3lIv/T/esjpVpr9agzL0xXVXoJm3bCDx2SrIac/4
	wDpqyXoEo7ADxkTvbOURgpfysrh7FaGGUQ5SnUQG80Yru4iU6VAH/qap9ZbwTU7uDt/b
	7CqWIuTiPnpM8dg3eZikxT/8P9naUykRVHGuf4FUB56YvJ2rr7xEf/Yf/gVH8UFxNdW8
	+GNqz17e+EOL20DUIPfy+b5LyGYuzr18Y5Z6SrphdtEvYr1uc0ZP85JnNqQpg2k4Yqt4
	8506HNA5lX4KprpuJYiVH9LmL+ctNYACWvhGJ0xHO16uPtLghQk84gIaKvXdyMnUfFC2
	NE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=wDT/MLZIHd6AUHRDvjcf9jVmvH1PUl18hD/AfpIO+TI=;
	b=JhYiVeSfUFn4zqgCOTzdHxRQJ61CgdB3IRrh2t9hZwSUnDwIuuxfnFJI/iiNZdV35c
	SnmhH8FJkHzKYZhpMVwkmGG6vpnhQ/jwPKMGx4ttTSXchUMsJoWRZzdEFj7eSv8zPQl+
	UbHap0gRKaxBviYFisygsThRWAr4hPekQl9XHNrYBH0MVFMLsSv+f5zWyfkSMwAZw1Et
	czmLU7ukX4bsuVTcv6GjVvCKtyOfK84IO4BYif0J1zo3iir8be0MhWsy1mfM7XHTVszX
	QY2Wna5ZaD8SZCDQ+iorcXMt57WoCDy2BHwxV8ON2sImuR123LlYkPnBzoWRgeWzyBTT
	/6rA==
X-Gm-Message-State: AMCzsaV+5EFaxQjpCtGoR21B1lOTWsuBRhx+E+YH1QfoFqR5EijvNzd9
	TeGUa2i5Ikz9g6zzkLDo9k+wx/DeCyrCQdu7Y4E=
X-Google-Smtp-Source: ABhQp+QXuKh/IA5dF8HSySjwW5a1ZGCTnv7CkYG2XkMysxiJzSfeVWYZvjOjqedHfyHdhFbA/RTO5/weT4hklHqZDAw=
X-Received: by 10.28.63.150 with SMTP id m144mr5707364wma.141.1508107761856;
	Sun, 15 Oct 2017 15:49:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Sun, 15 Oct 2017 15:49:21 -0700 (PDT)
In-Reply-To: <20171013025743.nlxch4j5pao44wmg@mentor.com>
References: <CAGhGL2Bd662Mb87cei+iHMMhUw4jyaAE9_pdGfBa3pE7BMQ=TQ@mail.gmail.com>
	<10260041.MN3fDUgrsp@peggleto-mobl.ger.corp.intel.com>
	<CA+chaQeTz0HknzwEBTjnh=AySYPe0_oDP6Zv4M_74RjnthQRzw@mail.gmail.com>
	<20171013025743.nlxch4j5pao44wmg@mentor.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 16 Oct 2017 00:49:21 +0200
Message-ID: <CA+chaQdNB+DsZighTTg58sA-RyFMPEP0TCuJzrPG-FJNjQmdNQ@mail.gmail.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Yocto security responses.
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
X-List-Received-Date: Sun, 15 Oct 2017 22:49:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 13, 2017 at 4:57 AM, Joe MacDonald <Joe_MacDonald@mentor.com>
wrote:

> Not to be brusque about it, but I've said all I intend to say on that
> patch and I've regularly marked it rejected in patchwork, but it keeps
> getting pulled back into the 'master-next' state, I assume by a script
> of some sort, so dnsmasq continues to be something that warrants special
> attention, because I know I manually have to tell my own automated
> processes to ignore it.  :-/
>

Thanks for merge to master, the meta-networking patches are usually in
master-next until they are merged.

I just do the rebase regularly and if they are still there after rebase I
sometimes don't dig in ML or patchwork status to find out if they are still
in review (and should stay in master-next) or already definitely refused
and I should drop them while rebasing.

Currently there are 4 pending meta-networking changes:
pick 6302b49 dnsmasq: disable the service by default
pick 45559fa openconnect: fix parallel compilation failure
pick aac7e9d squid: upgrade to 3.5.27
pick ff5e841 libmnl: Move to oe-core
(and my WIP spice changes which I haven't sent to ML yet).

I'll drop the first now as discussed in this thread (even when
https://patchwork.openembedded.org/patch/137644/ is still marked in
patchwork as "Master Next" not "Rejected").

I'll drop the 2nd as well based on the discussion in https://patchwork.
openembedded.org/patch/143205/

The 3rd one is for some reason marked as Changes Requested, but doesn't
include any ML discussion in https://patchwork.
openembedded.org/patch/143406/

and the last one should imho be merged, because in last batch you've merged:
b8210dd iproute2: Move tipc enablement to oe-core
which already depends on libmnl in oe-core.

