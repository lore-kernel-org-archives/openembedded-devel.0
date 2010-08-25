Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OoK4k-0004UV-0T
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 19:47:51 +0200
Received: by wwb18 with SMTP id 18so1375173wwb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Aug 2010 10:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=i4vHqyNGnj/LDlPsUGFSjwwvOUwUWCB4BPtDX8jxhSk=;
	b=KGn+PRcPn9PbSaTi5agidXpgbJqpHYrEKlyQsUjoc4eYFLXAZTjuAtgC+FLuqIw0Od
	wmRyCefwdilq55pfC8PlIyuJnToOd7EYBOiMcKXYGZt1mQdPdENVW8VjfvqHaf5eiiqH
	ce0MBv5fSnwhwvaoCnTU1CLdmaC6JL7jUC3s4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LhZY6ZFTMtUGXfCa9qO+1Ca2IglbV4fphnGoD1oRckwZuHrLZD80u95pICHJK8rbII
	Ada3JepkyQv4o5t9CgPZMiAjxm+P4dbTBKue/6pf0TZmhpvdzECxWLyXI3pi0oiFbwbG
	NpFzhyRg5PnobUsQdiPZ1qcnwUg6ystkiOwq0=
MIME-Version: 1.0
Received: by 10.227.127.149 with SMTP id g21mr7466906wbs.218.1282758443205;
	Wed, 25 Aug 2010 10:47:23 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Wed, 25 Aug 2010 10:47:23 -0700 (PDT)
In-Reply-To: <AANLkTikhCMBU=h90KpjDOEMEJgXDqVHdjpcLjdV9xq-s@mail.gmail.com>
References: <AANLkTikhCMBU=h90KpjDOEMEJgXDqVHdjpcLjdV9xq-s@mail.gmail.com>
Date: Wed, 25 Aug 2010 10:47:23 -0700
Message-ID: <AANLkTikXMR7j0r20XWCdMpDa69P92m6wbPLZVNH_Nob_@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.41
X-SA-Exim-Mail-From: vwyodapink@gmail.com
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
X-List-Received-Date: Wed, 25 Aug 2010 17:47:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

A huge thanks for taking the time AJ keep you the great work, I am
sure your helping tons of people me included!




On Wed, Aug 25, 2010 at 7:43 AM, AJ ONeal <coolaj86@gmail.com> wrote:
> Please give me feedback and I'll post this on the wiki.
>
> A task-oriented guide to creating a patch:
>
>
>
>> Let's say you create a new recipe and you'd like to submit it for inclus=
ion
>> (and you've already tested that it works, of course).
>>
>> 1. Now commit with a good strong helpful message
>>
>> =A0 =A0 git add recipes/nodejs/
>> =A0 =A0 git commit # don't use the -m option
>>
>> 2. The message should look like this
>>
>> =A0 =A0 added recipe for node.js
>>
>> =A0 =A0 * added recipe for node.js (bug #5555 - no nodejs recipe)
>> =A0 =A0 ** patched libev's wscript to not try to execute code
>> =A0 =A0 ** patched node's wscript to not search in '/usr/include'
>>
>> =A0 =A0 Signed-off-by: AJ ONeal <coolaj86@gmail.com>
>>
>> 3. Create your patch
>>
>> =A0 =A0 git format-patch -1 # or however many commits are part of this c=
hange
>>
>> 3++. If you are submitting a second version also add "--subject-prefix
>> [v2]"
>>
>> =A0 =A0 git send-email
>>
>> Your patch will be immediately visible on
>> http://patchwork.openembedded.org/patch/
>>
>
>
>> 4. Once your patch has been accepted or rejected, create an account and
>> update the status to "accepted" or "rejected"
>>
>> 4++. If you get soft-rejected (a lot of feedback), make the changes, sub=
mit
>> the next version, and update the status of the previous patch to
>> "superseded"
>>
>> Appendix: Properly configuring git (using tekkub@gmail.com as an example
>> user)
>>
>> =A0 =A0 sudo apt-get install git-core git-email
>> =A0 =A0 git config --global user.name "Tekkub"
>> =A0 =A0 git config --global user.email "tekkub@gmail.com"
>> =A0 =A0 git config --global sendemail.smtpserver smtp.gmail.com
>> =A0 =A0 git config --global sendemail.smtpserverport 587
>> =A0 =A0 git config --global sendemail.smtpencryption tls
>> =A0 =A0 git config --global sendemail.smtpuser tekkupl@gmail.com
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


