Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P135J-0000qt-VA
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 22:17:02 +0200
Received: by ywe9 with SMTP id 9so422002ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 13:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Geftz0/dYuVbsId0pYosfLmfqiYdI5IVUkD8DIUyw28=;
	b=nZC7oY60LmIuqpOEtQwPfMLMoHl98LWVCfH2gUtLSX4snBNsevgFuCTibRf2oSXEpS
	bC81iI+8T6DN/SQEI04ToKgewEpx8JMaXdQkayEiz5F2v2fEPE9x3/XshTEk7fjd7hXU
	Ixnf+YTiK15neebGzywTtmo9lM9XRtHK0ZXC0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fT0NuemPQTdYwmn7CWjp6UaQ1o6vvy+v45dKBeYQciMmwS7FuUhbZaUCVcPoO1Ni0Z
	045dkP8NHCo02dyluRJe/IDn55sILcc8Lwo2fZ76RZGKkp1cca7zhjLlQANnJoUcGa7V
	BOD/EHFQHcgsqIKnitLZKiFhGGZg2zZPoec/Q=
MIME-Version: 1.0
Received: by 10.231.167.67 with SMTP id p3mr2382530iby.20.1285791408306; Wed,
	29 Sep 2010 13:16:48 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Wed, 29 Sep 2010 13:16:47 -0700 (PDT)
In-Reply-To: <20100929183700.GB27217@denix.org>
References: <AANLkTinMWT7K-h+hH0LvPD119Nxxpitro=f6igQvL7-K@mail.gmail.com>
	<20100929183700.GB27217@denix.org>
Date: Wed, 29 Sep 2010 22:16:47 +0200
Message-ID: <AANLkTimD51tO=QkF8Bx3Gkq1zjwCWTV5+qbaRW8r1OpJ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] kernel NOTE messages fix
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
X-List-Received-Date: Wed, 29 Sep 2010 20:17:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/29 Denys Dmytriyenko <denis@denix.org>:
> On Tue, Sep 28, 2010 at 06:39:42PM +0200, Frans Meulenbroeks wrote:

>> -sysroot_stage_all_append() {
>> - =A0 =A0 =A0 sysroot_stage_dir ${D}/kernel ${SYSROOT_DESTDIR}${STAGING_=
KERNEL_DIR}
>
> BTW, won't this patch break packaged-staging? Has anyone tried rebuilding=
 from
> pstage after this fix?

I don't think it will break packaged staging. This is the function
sysroot_stage_dir:

sysroot_stage_dir() {
        src=3D"$1"
        dest=3D"$2"
        # This will remove empty directories so we can ignore them
        rmdir "$src" 2> /dev/null || true
        if [ -d "$src" ]; then
                mkdir -p "$dest"
                cp -fpPR "$src"/* "$dest"
        fi
}

Nothing related to packaged staging here.
And we still copy to ${SYSROOT_DESTDIR}${STAGING_KERNEL_DIR} (which is
the place where I assume things are packaged from)

Frans


