Return-Path: <akramh@aq1systems.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id D75A6731C6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Aug 2016 23:47:26 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id b62so95141436iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Aug 2016 16:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=aq1systems-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=BDJJnMNF3mJZQuLbX3TpcsWObBBX4v6FhF3QZdIjiMM=;
	b=uTFE9X2FUzLfqoBQi9nUEy2WbVU+VstIAbZzGxhLB0sdsuvuiNHlUtxcgjdc+/stt5
	uHv4IhtxI0SWkXlPpe2Nq+uSyFi2+7Xub23e6fmcVIn+wQrSQyjmxzug3KgYJFlSQQBN
	8+083VoUHT+KXTmHI8nk/OH1ia4EC6V6q4wvk7kjICkOzlmH63n1pQ5Vpl6TaMHZod1z
	EhBSNPDh91uBsABK75z/WFsIXyD4W7ZkVJo9PYX/HhptetmA1nzVsAzrw8P0oCM4/6Dq
	4Xjd9WhOGcEgAJEyx5T9FTLR7L5kBdp9OqPllKlNouk5ystOl9MExR6cf2fT4KkaEKgL
	xwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=BDJJnMNF3mJZQuLbX3TpcsWObBBX4v6FhF3QZdIjiMM=;
	b=a1w84JGwDgSUqKdp9TdS8gQQoGtvRAJa5zVqeKR1GeEEbjeKlJgGIpKMfiWL2jM99x
	Dbmd0zAFummwDC3YA3ATybnGfxa4zoIeFxvOIp0i+6aCXrc4FBeWPSMduZKjOq0jtNMN
	NEn/Vu9P12l9ItE2v2PHTRjW5gr69l4tE8kjDLwMMpP/bGrqz4Ivgx5LNLOoWqLT+kPm
	DM6jdxp1pP3/UcRMuXVUm+Y6+nEqBQ6759F8G/8Bn5sQgDUABeichg8wNH/odACnvt/h
	cm6dWjxr6YvyRD3YF2D0/m48qABo8M12wmK0TLMU8Of3ngqLyvawLrPFnPLLDEu9UvOX
	9K9A==
X-Gm-Message-State: AEkoouu1f1N0EX+7k1SLwvtUPZIEIJI63nzcbde2vum7QqDK7GWrI1ic025MN7Q+jqwCTRLetnmgmhrpuJJGyw==
X-Received: by 10.107.153.67 with SMTP id b64mr20332921ioe.79.1471823246454;
	Sun, 21 Aug 2016 16:47:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.13.146 with HTTP; Sun, 21 Aug 2016 16:47:25 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1608211008240.19995@localhost.localdomain>
References: <alpine.LFD.2.20.1608211008240.19995@localhost.localdomain>
From: Akram Hameed <akramh@aq1systems.com>
Date: Mon, 22 Aug 2016 09:47:25 +1000
Message-ID: <CALHzX6preAzf=wr+z6-fELJ=S4Xh+5ZNZ4D3N3B9mZAV17Ka1A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: is there an ETA for a recipe for mariadb 10.x?
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
X-List-Received-Date: Sun, 21 Aug 2016 23:47:27 -0000
Content-Type: text/plain; charset=UTF-8

No idea what is involved in migration from 5->10 Mariadb, but I note that
there's a recipe for the former in recipes-support:
https://layers.openembedded.org/layerindex/recipe/5974/

One might take the skeleton of that to build their 10.x recipe I guess!

On Mon, Aug 22, 2016 at 12:15 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   client wants to take advantage of features of mariadb 10.x in an OE
> build, but i see no official layer for it -- is it coming? or should
> one just hack up a recipe for it?
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

