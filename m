Received: from na3sys009aog114.obsmtp.com ([74.125.149.211])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1PuqGm-00042S-4A
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 18:55:29 +0100
Received: from source ([209.85.220.175]) (using TLSv1) by
	na3sys009aob114.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTW6ENp23B3s2O+/B9clON13VOk9xPIoP@postini.com;
	Wed, 02 Mar 2011 09:54:03 PST
Received: by vxd7 with SMTP id 7so198322vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 09:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Xyi46OWhe209iY9Ocn7ohsh4mIJi4N8XNR8Nr406f58=;
	b=fVS+U/mfPEBIe+9jQyx/xICAnzEfEFU7bN7LF6+jlP2IwD43qBdbK6Mw/m4cb7WDbL
	v/A49hc3vaQJQOVB/GlVnMWOUlT4BKnrktiizNMddQ/WmFl65CMEVK8LD0+7XO9f952K
	V1F19tfp8m8lZgmveBaSNTbkdM3XiPOakPlkE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=CexSwVyKriZlLHF0UzkrbA+9ztbOPSpDdasgr1eyG/eBAfxEX5bAAbagTfV8Wu9uhj
	+gc2ezkesqIFJvMuQFZ138pFmPj99Iv17KhgF8/8SetcUWXJvWC/DaRxgPR8SflpUzZP
	eenXD3ksKROOzQGMbgQ0U64YSY2nmtE+cxCGQ=
MIME-Version: 1.0
Received: by 10.52.171.173 with SMTP id av13mr67283vdc.304.1299088437554; Wed,
	02 Mar 2011 09:53:57 -0800 (PST)
Received: by 10.52.167.193 with HTTP; Wed, 2 Mar 2011 09:53:57 -0800 (PST)
In-Reply-To: <1299088233.23547.236.camel@phil-desktop>
References: <cover.1299076392.git.bengardiner@nanometrics.ca>
	<9a9ee76e6057e7dfe38af1d77b4ed7ffc9ff3775.1299076392.git.bengardiner@nanometrics.ca>
	<1299088233.23547.236.camel@phil-desktop>
Date: Wed, 2 Mar 2011 12:53:57 -0500
Message-ID: <AANLkTinKXr4pQe3xhTXh-UNVrjcymO625+BBJFpkQn5a@mail.gmail.com>
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] external-toolchain-csl: allow linux-libc-headers
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
X-List-Received-Date: Wed, 02 Mar 2011 17:55:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Phil,

On Wed, Mar 2, 2011 at 12:50 PM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2011-03-02 at 10:05 -0500, Ben Gardiner wrote:
>> - =A0 =A0 cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/include/* ${STA=
GING_INCDIR}
>> + =A0 =A0 rsync -a ${RSYNC_OPTS} ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/us=
r/include/* ${STAGING_INCDIR}
>
> If you want to exclude some files then it's probably better to use
> something like tar --exclude ... -cf - | tar -xf -. =A0(I think the
> --exclude option is in POSIX so any reasonable version of tar ought to
> have it.) =A0Or you could use some sort of "find | grep -v .. | xargs cp"
> construct to make a list of the files that you do want to copy. =A0Either
> of those is probably a better option than rsync.

Thanks for the alternatives.

I think the piped-tars option is pretty cool, it's alot like the
netcat-tar trick for when you don't have rsync handy, just no netcat.
:)

I will definitely keep that in mind for future tasks.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca


