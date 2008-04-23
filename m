Received: from [209.85.146.177] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JomJm-0003iS-OK
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Apr 2008 23:15:54 +0200
Received: by wa-out-1112.google.com with SMTP id l24so4705294waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2008 14:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=RBwuAVDGhJajQEbwE2BdEFfLyJY85uOM+1gimA4hffM=;
	b=mITlpuFfZHNTdYpQLt67k7mnrJQCRTQBfbmUky3Gz6+LiJZdcXyQHxuOgNYnFnFev2TN0ViBYQvrm2vUT/W66MtmlUZLLIxG1gO8mxkK/WQ+Bx3/fEsoYJU1AbWxDfItpZnPRlZTE5QOMoXkYQkvCZMuCru3EhRtB0n2Xnng5e4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=cx23S7ARRM+nSMqlvNHteR18gR5Cq+NptnTvyZtOX54LO4Mfq1FXz2Bqi7kzYJI7YfSUelU4oz54io/EEuJLKcp0QpvQclyIzme1GRXJLsBI2aqUhNyM7TWmCgFAEjskrYCLaya6gONvYrpLZwKtiGyGp2OzPZsIdixC8xnbcsE=
Received: by 10.114.179.1 with SMTP id b1mr1035456waf.42.1208985341579;
	Wed, 23 Apr 2008 14:15:41 -0700 (PDT)
Received: by 10.114.234.12 with HTTP; Wed, 23 Apr 2008 14:15:41 -0700 (PDT)
Message-ID: <19c1b8a90804231415q510604ffkb071438a716bdff4@mail.gmail.com>
Date: Wed, 23 Apr 2008 14:15:41 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1JolyI-0002vH-TM@daffy.sipo.nl>
MIME-Version: 1.0
References: <E1JolyI-0002vH-TM@daffy.sipo.nl>
Subject: Re: gcc & libssp disabled by default?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 23 Apr 2008 21:15:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

You need to edit the recipe.

Khem

On Wed, Apr 23, 2008 at 1:53 PM, RvP <lists@t3i.nl> wrote:
> Hi,
>
>  gcc versions 4.0.0 and later are currently being built without libssp
>  support: EXTRA_OECONF_BASE contains "--disable-libssp" in those recipes.
>
>  Why is that? E.g. mpd (music player daemon) needs libssp. As a work-around I
>  manually changed the .bb files for gcc 4.1.2 in paclages/gcc/ and removed the
>  --disable-libssp switch. Gcc now builds with libssp and all seems to run
>  without problems (on a NSLU2).
>
>  BTW. did I really need to edit the recipes in packages/gcc/ or could I have
>  set a variable elsewhere to enable libssp?
>
>  Cheers,
>
>  Richard.
>
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


