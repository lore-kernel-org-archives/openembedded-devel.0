Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ObLYy-0005g0-VW
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 00:45:26 +0200
Received: by iwn34 with SMTP id 34so6285286iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 15:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=dsxcvx8TP082qjj4FDabc+sr0jS1wHsL7A2431lKRN8=;
	b=kjc6mEnxgTvuLbRly3il6i+nRU4WdDxRZGORVS7MMitqRtVdmBCMrta68OGhAy8ICn
	cWB2xNl28NkZUpv8KXrlViXIRJnbOJh87taPy+MkYysva4/Lvo1I6ZBE8ShiUOSomQzw
	65Q5ZmT0FMVTOxfaXqLdoyo3VVJ7+fbWSVMRY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=jVi8hnrHihVYdbpD0Ef5I1xhWhOGtMViRoqcKAA5DCFCPKGeHwsjveKsiW8Mh44BUf
	07QQzJr7BYM4cde0NQrEsbjyUhV8iYJeUlxvgWNi6XXZqpriit2nKyS06wmdh/sh6dLG
	amN33RWp4zOjWfeKWImrVWTbG4xCN2jtjPFa8=
Received: by 10.231.167.80 with SMTP id p16mr7718638iby.119.1279665914366; 
	Tue, 20 Jul 2010 15:45:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Tue, 20 Jul 2010 15:44:54 -0700 (PDT)
In-Reply-To: <1279660488.4096.8.camel@mattotaupa>
References: <1279216536.3741.27.camel@mattotaupa>
	<1279270987.4164.29.camel@mattotaupa> 
	<AANLkTimGrdHiLeLLsInSl9L-KS8SbvNt4ws2kDcpEEN1@mail.gmail.com> 
	<i1qogv$i28$2@dough.gmane.org> <1279355702.14848.3.camel@mattotaupa> 
	<i1s6sg$d1j$1@dough.gmane.org> <1279464507.18570.59.camel@mattotaupa> 
	<1279660488.4096.8.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Jul 2010 15:44:54 -0700
Message-ID: <AANLkTinveVXhVJje5LRxRLru_Ju-C1TK76QHBOAoHcgB@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: angstrom-2008.1, uclibc: git-native: sysroot-destdir 6, 4 GB 	big, since some executables are 100 MB each
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
X-List-Received-Date: Tue, 20 Jul 2010 22:45:26 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 20, 2010 at 2:14 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Sonntag, den 18.07.2010, 16:48 +0200 schrieb Paul Menzel:
>> Am Samstag, den 17.07.2010, 14:15 +0200 schrieb Koen Kooi:
>> > On 17-07-10 10:35, Paul Menzel wrote:
>> > > Am Samstag, den 17.07.2010, 01:03 +0200 schrieb Koen Kooi:
>> > >> On 16-07-10 17:23, Khem Raj wrote:
>> > >>> On Fri, Jul 16, 2010 at 2:03 AM, Paul Menzel
>> > >>> <paulepanter@users.sourceforge.net> wrote:
>> > >
>> > >>>> Am Donnerstag, den 15.07.2010, 19:55 +0200 schrieb Paul Menzel:
>> > >>>>
>> > >>>>> I ran out of space and noticed
>> > >>>>>
>> > >>>>> =A0 =A0 /angstrom-dev/work/i686-linux/git-native-1.7.0.2-r4
>> > >>>>>
>> > >>>>> is 8,1G big.
>> > >>>>>
>> > >>>>> Some of the executable files in
>> > >>>>>
>> > >>>>> =A0 =A0 /angstrom-dev/work/i686-linux/git-native-1.7.0.2-r4/sysr=
oot-destdir/angstrom-dev/sysroots/i686-linux/usr/libexec/git-core/
>> > >>>>>
>> > >>>>> are 101 MB big.
>> > >>>
>> > >>> its most probably the -g3/-ggdb3 bloat.
>> > >>
>> > >> No, it's git not creating (hard)links but copies of the same app. R=
un an
>> > >> md5sum on the binaries, they will all match. I suggest you stop
>> > >> spreading FUD about -ggdb3, it is not being appriciated.
>> > >
>> > > I do not know anything about the technical background. I can only re=
port
>> > > that removing `-ggdb3` fixed it for me.
>> >
>> > Are you saying that removing -ggdb3 made git create proper (hard)links=
?
>>
>> No, I just said, that after doing as Khem suggested the available space
>> was big enough.
>>
>> Anyway, I tried to investigate a little and could not find anything
>> related to (hard)link problems. But probably I overlooked something. I
>> head refresh my memory about hard and soft links [1].
>>
>> 1. As you suggested in your reply I ran `md5sum` on the binaries. They
>> do indeed match on the binaries I posted, but also the inode matches. It
>> looks like that is way it should be.
>>
>> =A0 =A0 =A0 =A0 $ echo "Test" > test
>> =A0 =A0 =A0 =A0 $ ln test test.link
>> =A0 =A0 =A0 =A0 $ md5sum test*
>> =A0 =A0 =A0 =A0 2205e48de5f93c784733ffcca841d2b5 =A0test
>> =A0 =A0 =A0 =A0 2205e48de5f93c784733ffcca841d2b5 =A0test.link
>> =A0 =A0 =A0 =A0 $ ls -1i test*
>> =A0 =A0 =A0 =A0 3653430 test
>> =A0 =A0 =A0 =A0 3653430 test.link
>>
>> So I think the hardlinks were created properly. I did not think of this
>> when reporting the problem so I did not run `ls -i` on the listed files
>> and I did not check with `du`.
>>
>> =A0 =A0 =A0 =A0 /angstrom-dev/work/i686-linux/git-native-1.7.1.1-r0/imag=
e/angstrom-dev/sysroots/i686-linux/usr/libexec/git-core $ md5sum * | sort
>> =A0 =A0 =A0 =A0 [=85]
>> =A0 =A0 =A0 =A0 82c05218d9634923e301a9463e8f9c0d =A0git-shell
>> =A0 =A0 =A0 =A0 85edbd7803242b4895ed33b4fcfa3622 =A0git-remote-ftp
>> =A0 =A0 =A0 =A0 85edbd7803242b4895ed33b4fcfa3622 =A0git-remote-ftps
>> =A0 =A0 =A0 =A0 85edbd7803242b4895ed33b4fcfa3622 =A0git-remote-http
>> =A0 =A0 =A0 =A0 85edbd7803242b4895ed33b4fcfa3622 =A0git-remote-https
>> =A0 =A0 =A0 =A0 89a6ef52f4b7c336fb5fc0601edfd95f =A0git-mergetool
>> =A0 =A0 =A0 =A0 9a7f760ecef6e64f370c907d61ad0ffb =A0git-svn
>> =A0 =A0 =A0 =A0 9b57eb61ce668f2105a61a467f4d6d9b =A0git-difftool
>> =A0 =A0 =A0 =A0 ac3472a81bc59a69119b0d027c3f617b =A0git-merge-one-file
>> =A0 =A0 =A0 =A0 b14a5bba57d0ae0ccfdb0fceac0eb4ec =A0git-merge-octopus
>> =A0 =A0 =A0 =A0 b6899828bc756c5d30398d49dce91deb =A0git-cvsexportcommit
>> =A0 =A0 =A0 =A0 b775de2d21923f5d08e0bdcf3f9d31f6 =A0git-mergetool--lib
>> =A0 =A0 =A0 =A0 bd786a897bdc214bd5d89f51ad79f152 =A0git-instaweb
>> =A0 =A0 =A0 =A0 c8466908a274e211a43d287e510f2f19 =A0git-merge-resolve
>> =A0 =A0 =A0 =A0 ce109bd27d9404980bd82ddb529eca90 =A0git-send-email
>> =A0 =A0 =A0 =A0 d3da496bd962246727ceaabc1d4b1bdd =A0git-sh-setup
>> =A0 =A0 =A0 =A0 d46c9b755b712bf3c27521b3c6e5fd30 =A0git-relink
>> =A0 =A0 =A0 =A0 d4b577d9a69d9af883de29d6af4f04c5 =A0git
>> =A0 =A0 =A0 =A0 d4b577d9a69d9af883de29d6af4f04c5 =A0git-add
>> =A0 =A0 =A0 =A0 d4b577d9a69d9af883de29d6af4f04c5 =A0git-annotate
>> =A0 =A0 =A0 =A0 d4b577d9a69d9af883de29d6af4f04c5 =A0git-apply
>> =A0 =A0 =A0 =A0 [=85]
>>
>> =A0 =A0 =A0 =A0 /angstrom-dev/work/i686-linux/git-native-1.7.1.1-r0/imag=
e/angstrom-dev/sysroots/i686-linux/usr/libexec/git-core $ ls -1i
>> =A0 =A0 =A0 =A0 [ =85 ordered manually to match md5sum output]
>> =A0 =A0 =A0 =A0 3691063 git-shell
>> =A0 =A0 =A0 =A0 3691070 git-remote-ftp
>> =A0 =A0 =A0 =A0 3691070 git-remote-ftps
>> =A0 =A0 =A0 =A0 3691070 git-remote-http
>> =A0 =A0 =A0 =A0 3691070 git-remote-https
>> =A0 =A0 =A0 =A0 3691082 git-mergetool
>> =A0 =A0 =A0 =A0 3691100 git-svn
>> =A0 =A0 =A0 =A0 3691093 git-difftool
>> =A0 =A0 =A0 =A0 3691080 git-merge-one-file
>> =A0 =A0 =A0 =A0 3691079 git-merge-octopus
>> =A0 =A0 =A0 =A0 3691095 git-cvsexportcommit
>> =A0 =A0 =A0 =A0 3691102 git-mergetool--lib
>> =A0 =A0 =A0 =A0 3691101 git-instaweb
>> =A0 =A0 =A0 =A0 3691081 git-merge-resolve
>> =A0 =A0 =A0 =A0 3691099 git-send-email
>> =A0 =A0 =A0 =A0 3691104 git-sh-setup
>> =A0 =A0 =A0 =A0 3691098 git-relink
>> =A0 =A0 =A0 =A0 3691105 git
>> =A0 =A0 =A0 =A0 [=85]
>>
>> What did I miss? Were you seeing something different?
>>
>> 2. You seem to have investigated this problem before and committed a fix
>> for git [2].
>>
>> =A0 =A0 git 1.7.0.2: fix hardlinking problems as reported by Eric Bromba=
ugh
>>
>> I could not find Eric=92s report on this list or the Web. So I have to
>> test without your patch. But `git-native` does not seem to use your
>> patch, so I guess the behavior should be the one without your patch.
>>
>> Could you please tell me if my observations are correct.
>
> I am a little bit lost. Koen, could you give me a pointer, please, so
> that I can try to continue to solve this issue.
>

Koen fixed it for target git recipe I guess you need to port that fix
to git-native as well.
if you want to use git-native built with OE.

>
> Thanks,
>
> Paul
>
>
>> [1] info coreutils "ln invocation"
>> [2] http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D84de5=
1631e1e7bb76141332807ed2ba9e8df02ae
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


