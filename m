Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Oz81J-00006P-J6
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 15:08:58 +0200
Received: by wwb34 with SMTP id 34so47063wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 06:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=scoYXueriUKuamFC4kL88MdAtA/X0ExsZ5qYSRIopA0=;
	b=rFWO9m4SD0o/VKdE959VawM9/Z8P42Vh7IplGSF9me+PTBXFXcMwhEJZqxZ59gl7Lu
	UMX6kUoG79ZU7vJau3/Xx/F/bxXcJELH8iOzmPy/pnjKYT0wkAwpzk514gZUfbwY5qnn
	7B9cLmIsiYy0EUvNCzL1ebHlFhY6ZRO2uSZKY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HrR0CLBjWHVr+V9P1PgYW/j6JWMNp9KksCnbMb4v/duONalxEcab4tVHvcHqXuJ5Y9
	5AhIok65XjF+YppZiqx+A5PtKi+ePSfPUlm+jnBgq8xtiW8lSi4gyA+EE6JJeI9hzgSl
	ZKsbL02d7TxJHCbNYXeRyFPm0+X03fyj+HWDg=
MIME-Version: 1.0
Received: by 10.227.151.148 with SMTP id c20mr2989422wbw.15.1285333730749;
	Fri, 24 Sep 2010 06:08:50 -0700 (PDT)
Received: by 10.216.72.212 with HTTP; Fri, 24 Sep 2010 06:08:50 -0700 (PDT)
In-Reply-To: <1285314751.3715.5.camel@mattotaupa>
References: <AANLkTinzRQGe9CLG_n5g0sFG0NDdZBdU2RSL9KjgzokP@mail.gmail.com>
	<1285314751.3715.5.camel@mattotaupa>
Date: Fri, 24 Sep 2010 09:08:50 -0400
Message-ID: <AANLkTikb5hgNJT+qCwWye8WLZz2DTPj=JvLUXgMy+Z3J@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: git error ?
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
X-List-Received-Date: Fri, 24 Sep 2010 13:09:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 24, 2010 at 3:52 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Donnerstag, den 23.09.2010, 22:11 +0200 schrieb Frans Meulenbroeks:
>> Hm,
>>
>> On my latest git push I got:
>>
>> frans@linux-suse:~/oe/openembedded> git push
>> Counting objects: 13, done.
>> Delta compression using up to 2 threads.
>> Compressing objects: 100% (7/7), done.
>> Writing objects: 100% (8/8), 649 bytes, done.
>> Total 8 (delta 6), reused 0 (delta 0)
>> error: unable to create temporary sha1 filename : Read-only file system
>>
>> fatal: failed to write object
>> error: unpack failed: unpack-objects abnormal exit
>> To git@git.openembedded.org:openembedded
>> =A0! [remote rejected] org.openembedded.dev -> org.openembedded.dev (n/a
>> (unpacker error))
>> error: failed to push some refs to 'git@git.openembedded.org:openembedde=
d'
>>
>>
>> No idea what is going on here, guess it is at the git side. My fs is not=
 r/o
>
> I just wanted confirm, that you are not alone with this Git server
> problem. I am getting the same error as some weeks ago [1].
>
> =A0 =A0 =A0 =A0$ git remote update
> =A0 =A0 =A0 =A0Fetching origin
> =A0 =A0 =A0 =A0git.openembedded.org[0: 140.211.169.165]: errno=3DConnecti=
on refused
> =A0 =A0 =A0 =A0fatal: unable to connect a socket (Connection refused)
> =A0 =A0 =A0 =A0error: Could not fetch origin

This has been fixed -- we had an issue after the recent upgrade where
the git-daemon did not restart after system reboot.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


