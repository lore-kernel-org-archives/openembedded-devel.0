Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OvvbR-00051J-1M
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 19:17:02 +0200
Received: by gwb10 with SMTP id 10so145725gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 10:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=MQ+bk8o1m9gFrhXTh/X54g/c9YlF0Ok2qLMrmWKV7jc=;
	b=IgHBPWQ7LVsF8ROAV7qocEs45UyxKWu87QAOkikdEaLopJ2GkaTsGcW8n1J9QnRt6H
	QNf7kW4BVEsl9YRJDZrBR8UJJWLH9kjMERdqySpunDwXFtfL4UW4g1oC14e9t8XSpk4A
	9LUbSWtYeVhAdiEKqRf5/RnEFb3lCVPmrNWWY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=GRFPmUVNdA+3VOAskFsHr08BzElh58S/gZztwoiXRm+FgEvXqCb9nDalKr8zTtDqdl
	N286DKZfzmDTvidSiuiaL1Ho4DiVJdiuFPhu9G97hSwznPp+IFNu6GVCllwqpx8Idk+4
	Ii3ScAf6rdTNQgCHJTtsgROBuY9xyYLOMioqw=
Received: by 10.150.58.9 with SMTP id g9mr2344143yba.113.1284570970337; Wed,
	15 Sep 2010 10:16:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Wed, 15 Sep 2010 10:15:50 -0700 (PDT)
In-Reply-To: <AANLkTi=jO6w-FQ0a_6Ny7Cv56QKmQoBSJtjvEeCEMscP@mail.gmail.com>
References: <AANLkTikhCMBU=h90KpjDOEMEJgXDqVHdjpcLjdV9xq-s@mail.gmail.com>
	<AANLkTi=jO6w-FQ0a_6Ny7Cv56QKmQoBSJtjvEeCEMscP@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Sep 2010 10:15:50 -0700
Message-ID: <AANLkTinmn3B8mGhhkAEwgXckZ3C8Chb02GucALe99XFT@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Patch procedure for dummies
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
X-List-Received-Date: Wed, 15 Sep 2010 17:17:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 15, 2010 at 9:41 AM, AJ ONeal <coolaj86@gmail.com> wrote:
> I believe that I have compiled all of the notes from this thread into the
> wiki:
> http://wiki.openembedded.net/index.php/How_to_submit_a_patch_for_dummies
>
> Please review and give feedback.


looks good. I have done some corrections and additions on the page.

>
> AJ ONeal
>
>
> On Wed, Aug 25, 2010 at 8:43 AM, AJ ONeal <coolaj86@gmail.com> wrote:
>
>> Please give me feedback and I'll post this on the wiki.
>>
>> A task-oriented guide to creating a patch:
>>
>>
>>
>>> Let's say you create a new recipe and you'd like to submit it for
>>> inclusion (and you've already tested that it works, of course).
>>>
>>> 1. Now commit with a good strong helpful message
>>>
>>> =C2=A0 =C2=A0 git add recipes/nodejs/
>>> =C2=A0 =C2=A0 git commit # don't use the -m option
>>>
>>> 2. The message should look like this
>>>
>>> =C2=A0 =C2=A0 added recipe for node.js
>>>
>>> =C2=A0 =C2=A0 * added recipe for node.js (bug #5555 - no nodejs recipe)
>>> =C2=A0 =C2=A0 ** patched libev's wscript to not try to execute code
>>> =C2=A0 =C2=A0 ** patched node's wscript to not search in '/usr/include'
>>>
>>> =C2=A0 =C2=A0 Signed-off-by: AJ ONeal <coolaj86@gmail.com>
>>>
>>> 3. Create your patch
>>>
>>> =C2=A0 =C2=A0 git format-patch -1 # or however many commits are part of=
 this change
>>>
>>> 3++. If you are submitting a second version also add "--subject-prefix
>>> [v2]"
>>>
>>> =C2=A0 =C2=A0 git send-email
>>>
>>> Your patch will be immediately visible on
>>> http://patchwork.openembedded.org/patch/
>>>
>>
>>
>>> 4. Once your patch has been accepted or rejected, create an account and
>>> update the status to "accepted" or "rejected"
>>>
>>> 4++. If you get soft-rejected (a lot of feedback), make the changes,
>>> submit the next version, and update the status of the previous patch to
>>> "superseded"
>>>
>>> Appendix: Properly configuring git (using tekkub@gmail.com as an exampl=
e
>>> user)
>>>
>>> =C2=A0 =C2=A0 sudo apt-get install git-core git-email
>>> =C2=A0 =C2=A0 git config --global user.name "Tekkub"
>>> =C2=A0 =C2=A0 git config --global user.email "tekkub@gmail.com"
>>> =C2=A0 =C2=A0 git config --global sendemail.smtpserver smtp.gmail.com
>>> =C2=A0 =C2=A0 git config --global sendemail.smtpserverport 587
>>> =C2=A0 =C2=A0 git config --global sendemail.smtpencryption tls
>>> =C2=A0 =C2=A0 git config --global sendemail.smtpuser tekkupl@gmail.com
>>>
>>
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
-Khem


