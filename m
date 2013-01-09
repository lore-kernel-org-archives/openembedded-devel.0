Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsyiL-0007A3-VL
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 17:41:19 +0100
Received: from mail-vb0-f71.google.com ([209.85.212.71])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 09 Jan 2013 08:25:02 -0800
Received: by mail-vb0-f71.google.com with SMTP id p1so3226132vbi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2013 08:26:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=h3IuoSWbD92cD/AuzC6REfMePRW2QZyFjJrQMqVBho4=;
	b=eWkTIi79hIX+5rbhnftyj1ZPkbq4PGC6aIxR2D7TLZVfnujnvnzXzOvBZq0qBIY0d8
	pQn+Ys9ZPpPulkpWZumEvFi6fmH1G4l69v0qTZaxCsCBIly/1MPDQSouOENnA3EnCwTG
	2MTyXaAlO22RBd7DxthkkbFxWtS5FUg/fSmdpdqb77AIb3lz3bZj0LoiUW/CzfOUsrEm
	iyjdZmxoWhhWD87XQSOWkGsjf417HUoDr/wR1999F6fxI4NBwY56BI5WNxRjeKJ4sqHZ
	Ng59ysyLhhGKYwff4RK62rEttfJn3LiI+4ZK9Vt47eVdcLmByYhaNHvOSRuLFEv4YOmC
	Mgbw==
X-Received: by 10.220.247.136 with SMTP id mc8mr10937463vcb.44.1357748760812; 
	Wed, 09 Jan 2013 08:26:00 -0800 (PST)
Received: by 10.220.247.136 with SMTP id mc8mr10937460vcb.44.1357748760724;
	Wed, 09 Jan 2013 08:26:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Wed, 9 Jan 2013 08:25:40 -0800 (PST)
In-Reply-To: <CALbNGRTEiLQ8JkN1PvRc6k2rbuvnozP79ywYudMaUyXNViGpSg@mail.gmail.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20121223201634.GN8988@jama.palm1.palmone.com>
	<20121224091242.GS8988@jama.palm1.palmone.com>
	<20130109132813.GJ3722@jama.palm1.palmone.com>
	<CALbNGRTEiLQ8JkN1PvRc6k2rbuvnozP79ywYudMaUyXNViGpSg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Jan 2013 16:25:40 +0000
Message-ID: <CAJTo0LZT_b4mRrYJOVJzfTzgU4-ipZhswQme-=FqFNGD6q845g@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQl7UaC0nPCRJjriOd2hko1VAiUHrh9gsFaj+SfABF47NAwXibajVjJb3CuEqI+N1RNDLm37NHMr+ONQSSNFdIwIQ/5SUfLvlBugxN6+WjvQQVnepGNzRJGUup9njKgVhfwgZcLC+QsNgSl+QeuP0NH7n4if+a/nUEJB5N7GsdLUIdfPH64IVZAqq6ZYnahVUqg6cYvr
Cc: openembedded-core@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core] State of bitbake world
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
X-List-Received-Date: Wed, 09 Jan 2013 16:41:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 9 January 2013 15:17, Andreas M=C3=BCller <schnitzeltony@googlemail.com>=
 wrote:
> 2. bitbake libnotify3 -> Tons of: 'WARNING: The recipe libnotify3 is
> trying to install files into a shared area when those files already
> exist. Those files and their manifest location are:
>    /home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/lib/libnotify.a
>    Matched in manifest-overo-libnotify

The current libnotify doesn't actually depend on GTK+ 2 or GTK+ 3
(well, the tests do, but that's trivially resolved with an
upstreamable patch to add --disable-tests), so we don't need two
recipes.

Speaking of GTK+ 3, I'm about to start pushing a series to add it to oe-cor=
e.

Ross


