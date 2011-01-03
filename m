Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PZriy-0007bZ-N6
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 22:13:52 +0100
Received: by fxm17 with SMTP id 17so12788705fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 13:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=xPlKUORy/2kX0Wtedfi8Davn0Y4x6n0jhhcJfI8mO8s=;
	b=h3Wg9g4KTuOpemA6kVC8xtcbW/oidN0998hG2Nye3n7l0NqUZyTC4rWyYE5bKghY3u
	IOaP3VZRhcDkBbAe7jl/WkzSmM2C7/xQmYne8bwVuoEoJjarbLnwRFMAh94G8d/g+jwk
	mrXMHDO970b5hTmCYtQXtueMrrwefiAOHVTyY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=n+dB5bmINkXzE2SX31cxSSGvgxl0jqLmA5odjO19tMlJjRS8Hb77kKDEKet92g3aqO
	A6PH8XwnD2um5+y5aSi0N16g31DMV1sdP/7N7gK3PAtG603I3JzgKTpdJzd0VJxLYh2C
	nGeHECa78IFixcqFrE33mEQVvKg+Ejk5PQdgE=
Received: by 10.223.75.194 with SMTP id z2mr40437faj.38.1294089210945;
	Mon, 03 Jan 2011 13:13:30 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id a25sm4902585fak.44.2011.01.03.13.13.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 Jan 2011 13:13:30 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PZria-0001Bj-EF; Mon, 03 Jan 2011 22:13:28 +0100
Date: Mon, 3 Jan 2011 22:13:28 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110103211328.GF25803@mx.loc>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
	<1294084926-3115-8-git-send-email-rep.dot.nop@gmail.com>
	<201101040001.25051.roman@khimov.ru>
MIME-Version: 1.0
In-Reply-To: <201101040001.25051.roman@khimov.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 08/12] busybox: provide -passwd and -shadow packages
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
X-List-Received-Date: Mon, 03 Jan 2011 21:13:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jan 04, 2011 at 12:01:24AM +0300, Roman I Khimov wrote:
>В сообщении от Понедельник 03 января 2011 23:02:02 автор Bernhard Reutner-
>Fischer написал:
>> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>> ---
>>  recipes/busybox/busybox.inc      |   28 ++++++++++++++++++++++++++++
>>  recipes/busybox/busybox_1.1x.inc |    2 ++
>>  recipes/busybox/files/passwd     |   11 +++++++++++
>>  recipes/busybox/files/shadow     |   11 +++++++++++
>>  4 files changed, 52 insertions(+), 0 deletions(-)
>>  create mode 100644 recipes/busybox/files/passwd
>>  create mode 100644 recipes/busybox/files/shadow
>
>I don't quite understand why is it needed. We have base-passwd for passwd (and 
>group) and missing shadow usually is not an issue (if my memory serves me 
>right, it'll be created on first usage). Then, speaking of base-passwd that 
>needs to be updated to use alternatives if this goes in.

I intend to use busybox-passwd as replacement for micro-image (will send
that as an RFC later tonight). I want micro-image to just contain the
bare minimum (and all of it provided by busybox).


