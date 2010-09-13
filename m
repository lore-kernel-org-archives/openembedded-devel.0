Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OvGOk-0005va-Qp
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 23:17:11 +0200
Received: by yxg6 with SMTP id 6so1803724yxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 14:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=L9WpR19ypif7JXCYSb0cSBbKZ+nJlvRT6b4yG2QRdZg=;
	b=s0NhlI5YhMg21n5le/QjmplbAwAhwar1P+mTiYY9/wZGcVwy1xRNCBAxaQ+6kd265T
	zwjjTgQMiSKf/Xmr9c1J02yQKaXCzmZbL7sAS7a54ePUWjwFeZ1M7Oaa7hA/9kZEzdmw
	kQnVb2w/Y3KRmHVm9ilutRaSbjow+Eqac4LQE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=EQ6WV+/lt7/CKOlPZx81K0uq59sEHnSMRXQpV/e7bUwMipzb5AQoSmkjeSxis2h58Y
	lhcKnlJyz16GKey1jZ1gYHrETXtH1D6Uc7QeAS7a/o222zL38NMP9BxRsp3uz9J4lP8s
	Mo8//fi6of/gGkz/x6XcXHFPNRwQHc6VLBs80=
MIME-Version: 1.0
Received: by 10.90.82.4 with SMTP id f4mr3054660agb.129.1284412552826; Mon, 13
	Sep 2010 14:15:52 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 13 Sep 2010 14:15:52 -0700 (PDT)
In-Reply-To: <AANLkTimkhhnmDTWH3=Vx5hVN=Hpy5WXpnUX-E5QfRobb@mail.gmail.com>
References: <AANLkTimXc3kLFR1m1uXM6OXZQn3idnbiDcEHPU0wpwEC@mail.gmail.com>
	<AANLkTikd-_vDny=kJKeS+NVWeYyfxiE_yXdUE+t1ac48@mail.gmail.com>
	<AANLkTi=s9gHBx_uPgiPGhu9b7D10JGytQaxyd-SZ+sfQ@mail.gmail.com>
	<AANLkTinWXK-HZHOLv2b2ApdPQ+LW22bvwsOO5TGOc1kx@mail.gmail.com>
	<AANLkTim9n1JsDc+bmYN5g20kBtobi5Ti-60Joq1U_rQZ@mail.gmail.com>
	<AANLkTi=r1NxVPeRVSSP24YXJSRDxUBwvLQo4PH6_iRxj@mail.gmail.com>
	<AANLkTimkhhnmDTWH3=Vx5hVN=Hpy5WXpnUX-E5QfRobb@mail.gmail.com>
Date: Mon, 13 Sep 2010 23:15:52 +0200
Message-ID: <AANLkTimEzD2CheY1Vwhb6Ag1aTxWZt0Z78QEDJ3HknjR@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: script to remove orphaned files
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
X-List-Received-Date: Mon, 13 Sep 2010 21:17:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/13 Khem Raj <raj.khem@gmail.com>:
> On Mon, Sep 13, 2010 at 1:20 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> As I don't really see progress on this, I am planning to take action
>> in a few days.
>> Since Khem expressed a preference to keep the files accessible, I'm
>> planning not to remove the unneeded patches, but instead move the to
>> the obsolete dir.
>> (alternate could be to move them to a dir called unused in the recipe dir).
>> Removal will be tested by verifying that bitbake -c patch remains
>> working on all dirs where unused files are removed.
>>
>
> sometimes same names patches exist in different dirs and if you remove
> one then it will start picking the other one
> silently so make sure such cases are not there. In general I am wary
> of mass changes which could creep in some bugs like that
> Ideally I would suggest that you look at each and every change before its final.
>

I am aware of thi (and the trickery behind FILESDIR and FILESPATHPKG
(if I remembered the names right).
The starting point of this is the patch file.
If the file occurs in any recipe (*.bb or *.inc file) in that dir the
file will not be moved.

The script goes like:
find -name "*.diff" -o -name "*.patch" | (while  read name
   do
       bname=`basename $name`
       grep -q $bname *.bb *.inc || \
       if [ $delete -eq 0 ]
       then
       echo $name " is unused"
       else
# cmd to create dir before the move has to be added here
       git mv $name unused/$name
       removed=1
       fi
   done

Also recipes which have a file:// construct with ${PV} in it will be
untouched (or manually processed).
I can make and post patches for this but the amount will probably not
make anyone happy. (don't have the exact number of files handy, it is
listed before in an earlier thread, but I vaguley recall some 200+
files, not sure about the # of recipes affected.

Frans


