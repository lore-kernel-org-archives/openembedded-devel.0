Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P4xeJ-0002IA-QB
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 17:17:20 +0200
Received: by gyd8 with SMTP id 8so807926gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 08:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=v6cezJTElnah33o9iFuBKArFUcP02T6fNTwWtaYkS7o=;
	b=GMdOldzcsBo7bhwZj1kdiw/zDSw8fFDb4HKqr3oo06xuHDNYG/1mvF3lMLya1LQqwn
	6jg2bpgUh3tjtwUZEzqS3dymglGXZHklqsx/A8uFk3kJn6j/RdcL1cTKo0YaLm3y04Dx
	UeXkXGq/3weaFj0ZHTfD2iDi0V4DciLTJ3/ew=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=h+EZQMyxl8B4uGe/zXiFH/NOckE6ENW5yYEDdWP+3FD9AELLNhtZOGw3mVMrZXExDu
	WIZnS75q5/L3KFZTGJHjE+3al/jJYOl+/PqfXoUpLMRIkRFsV1U4GcfKBZrQrbcU+TFF
	rKX+lQ/BbVlykR7FiHTYuGUQCUH1OWagJbyd0=
Received: by 10.90.83.13 with SMTP id g13mr2557482agb.34.1286723809133; Sun,
	10 Oct 2010 08:16:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.77.10 with HTTP; Sun, 10 Oct 2010 08:16:28 -0700 (PDT)
In-Reply-To: <1286705354.9551.2.camel@Nokia-N900>
References: <1286704333-27208-1-git-send-email-raj.khem@gmail.com>
	<1286705354.9551.2.camel@Nokia-N900>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Oct 2010 08:16:28 -0700
Message-ID: <AANLkTim6MSnW4XoqWf0xFswhYbSxyZNLETFyYrK8JvdL@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bitbake.conf: Increase IMAGE_EXTRA_SPACE 4 times
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
X-List-Received-Date: Sun, 10 Oct 2010 15:17:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 10, 2010 at 3:09 AM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
>> * Building native-sdk-image or x11-image genext2fs fails
>>=C2=A0 =C2=A0 =C2=A0as it runs out of space. This change helps it with ex=
tra
>>=C2=A0 =C2=A0 =C2=A0space needs.
>
> Out of space or out of inodes? Please check.

Well I tried to increase inodes manually. that did not help

>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


