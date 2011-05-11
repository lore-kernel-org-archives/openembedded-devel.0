Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1QKG0R-0002of-SU
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 May 2011 22:27:39 +0200
Received: by fxm19 with SMTP id 19so711720fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2011 13:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=QlzCQwZ5M5FRRFDrmaEhHXKsE8gW4w4B9uWt0gO4RwY=;
	b=AqOJnIaJ5lDpGrNBVjRyOIXo+C0vg6jHwQdnFwRTNhELz4/D4g1B64Z+9i1s9TNcT4
	tOI5QdIYvPoUrr5z4rRFdtdcpLcDlicsk3nM7xl1Dk/1ZJ7mqQFXql6ZN2A+jXW+fEuH
	ubEODIAp+dstAbBo5XmmCU5/vGvO5RIeATJwg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=qeR0IFGrP/1W2D2o4ASyNZQGxaguNk3i9g/Qhaj8mINdlyz2WHmGNxBVBQk+MS08vP
	XXWxDFw6jBMBoMiNyjvCVfeckWUaICBzvWRs6x1aB+n05dWcuTB6zlmlUJ1Fz0wptG1m
	mhA/+ns3DQi6BCwUPrFnZBHgoqTTfjMGK0UvU=
Received: by 10.223.66.208 with SMTP id o16mr813538fai.122.1305145492507;
	Wed, 11 May 2011 13:24:52 -0700 (PDT)
Received: from s42.loc (85-127-250-41.dynamic.xdsl-line.inode.at
	[85.127.250.41])
	by mx.google.com with ESMTPS id p16sm204586fax.45.2011.05.11.13.24.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2011 13:24:51 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.75)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1QKFy2-0004z0-Ah; Wed, 11 May 2011 22:25:10 +0200
Date: Wed, 11 May 2011 22:25:10 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110511202510.GG7657@mx.loc>
References: <1305062085.9982.62.camel@mattotaupa>
	<1305133911.2421.29.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1305133911.2421.29.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: minimal-uclibc: systemd fails with `src/manager.c:257:42: error: 'EPOLL_CLOEXEC' undeclared (first use in this function)`
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
X-List-Received-Date: Wed, 11 May 2011 20:27:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 11, 2011 at 06:11:51PM +0100, Phil Blundell wrote:
>On Tue, 2011-05-10 at 23:14 +0200, Paul Menzel wrote:
>> I am no uClibc expert, but do you know if uClibc will provide
>> `EPOLL_CLOEXEC` in the near future? How should systemd fix that?
>
>It's not just EPOLL_CLOEXEC: uClibc seems to be missing epoll_create1()
>entirely.  As far as I know there's nothing complex about that, though:
>it's just a standard syscall wrapper, so I don't know why it would have
>been deliberately left out.  I guess you'd have to ask the uClibc h4x0rs
>about that.
>
>There probably is no trivial workaround available to systemd.  If you
>wanted a quick hack to make it work then you could call
>syscall(SYS_epoll_create1, O_CLOEXEC) manually.  Or you could perhaps
>eliminate the usage of EPOLL_CLOEXEC in favour of a separate fcntl()
>call, but that may not be safe if systemd is multithreaded.

It was only omitted until now since nobody asked for it.

You should be set if you can trick someone into updating to
c91c3a2b27f5909e190cde4518383864298e82af or later.


