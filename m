Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1Ovv4j-0004Or-F8
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 18:43:14 +0200
Received: by eyb7 with SMTP id 7so238998eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 09:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=alZNQQ2UaqAbGey9e7amA/cPBn4nr2o5mLabA2HsxZY=;
	b=uyZV6BXTA9YCMdiDaOj2CtGJffvB+2KG5UQGN1d2iyVRbx4f0dMz4N0yaHRk594JrB
	3YHDguktu4XsCoRRLcYIGFhpbSVtKgplfqcqWtQemhO3ab8cHmbS5k9cifutUibEkjXS
	otf7Zdx4laetum9ssvE5byqJZfggKfh0wOjH8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=uoFDz2VrZvihVyJYXp5IwS+MPaux1Po8jRBvAUOftDqoIZUuXEiOB723AvHR7twqfi
	v1qf1rMss4nVNTZkdntS9YoUFiHmzRIwAjflTzGTDQdcBRD8sUclU8d/+4IT+ejV8olH
	5NzmXSDaN0vMIy4otVgTGaJd5y7vMFIksJuJM=
Received: by 10.223.123.14 with SMTP id n14mr727715far.106.1284568934120; Wed,
	15 Sep 2010 09:42:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.121.5 with HTTP; Wed, 15 Sep 2010 09:41:22 -0700 (PDT)
In-Reply-To: <AANLkTikhCMBU=h90KpjDOEMEJgXDqVHdjpcLjdV9xq-s@mail.gmail.com>
References: <AANLkTikhCMBU=h90KpjDOEMEJgXDqVHdjpcLjdV9xq-s@mail.gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Wed, 15 Sep 2010 10:41:22 -0600
Message-ID: <AANLkTi=jO6w-FQ0a_6Ny7Cv56QKmQoBSJtjvEeCEMscP@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Wed, 15 Sep 2010 16:43:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

I believe that I have compiled all of the notes from this thread into the
wiki:
http://wiki.openembedded.net/index.php/How_to_submit_a_patch_for_dummies

Please review and give feedback.

AJ ONeal


On Wed, Aug 25, 2010 at 8:43 AM, AJ ONeal <coolaj86@gmail.com> wrote:

> Please give me feedback and I'll post this on the wiki.
>
> A task-oriented guide to creating a patch:
>
>
>
>> Let's say you create a new recipe and you'd like to submit it for
>> inclusion (and you've already tested that it works, of course).
>>
>> 1. Now commit with a good strong helpful message
>>
>>     git add recipes/nodejs/
>>     git commit # don't use the -m option
>>
>> 2. The message should look like this
>>
>>     added recipe for node.js
>>
>>     * added recipe for node.js (bug #5555 - no nodejs recipe)
>>     ** patched libev's wscript to not try to execute code
>>     ** patched node's wscript to not search in '/usr/include'
>>
>>     Signed-off-by: AJ ONeal <coolaj86@gmail.com>
>>
>> 3. Create your patch
>>
>>     git format-patch -1 # or however many commits are part of this change
>>
>> 3++. If you are submitting a second version also add "--subject-prefix
>> [v2]"
>>
>>     git send-email
>>
>> Your patch will be immediately visible on
>> http://patchwork.openembedded.org/patch/
>>
>
>
>> 4. Once your patch has been accepted or rejected, create an account and
>> update the status to "accepted" or "rejected"
>>
>> 4++. If you get soft-rejected (a lot of feedback), make the changes,
>> submit the next version, and update the status of the previous patch to
>> "superseded"
>>
>> Appendix: Properly configuring git (using tekkub@gmail.com as an example
>> user)
>>
>>     sudo apt-get install git-core git-email
>>     git config --global user.name "Tekkub"
>>     git config --global user.email "tekkub@gmail.com"
>>     git config --global sendemail.smtpserver smtp.gmail.com
>>     git config --global sendemail.smtpserverport 587
>>     git config --global sendemail.smtpencryption tls
>>     git config --global sendemail.smtpuser tekkupl@gmail.com
>>
>
>

