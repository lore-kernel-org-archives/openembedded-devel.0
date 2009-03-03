Received: from [209.85.162.182] (helo=el-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philipp.zabel@gmail.com>) id 1LePpm-0006eG-Je
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Mar 2009 09:18:42 +0100
Received: by el-out-1112.google.com with SMTP id v27so3618620ele.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2009 00:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=VB/7BX7rQuhR9AFMQzqeHImYVTx7Y/h/+zCWdUUYHoM=;
	b=keeEAcSQbNpN7Vrn0ou4BmwzGPM4gkRDpPAZ99OK5BdGyzCwSHS+iPCfbLp+LUds9U
	7q8J9j4z5FqsqDbx06l/Sl9oyXXulVnZDcEeElpvGwk1ejakXFLX3l/Q0abLUkC9eejM
	6nzgLTSTpXrNjB9Cn3pX421RrT9za0hkFafhw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=P/2kU8nCuUc+Wmtxe10J8vIEd8O1yexrpeo/h9JTqW9cjuM7+ax6pLjjtq7b9eBaXn
	KNLBIz1xhcJKxcWYtoYtMh460SLN5tqpCY0crGSr4VGCZPMe1P3D1KvC3hKBwuBkvBAD
	LFnW1eJjubGSVaDVhjl1PoJYcF54rlVXDEk6w=
MIME-Version: 1.0
Received: by 10.150.95.15 with SMTP id s15mr571914ybb.140.1236068077479; Tue, 
	03 Mar 2009 00:14:37 -0800 (PST)
In-Reply-To: <49ACC60F.9050808@tait.co.nz>
References: <49AB58CA.7090406@tait.co.nz> <gohslm$3bl$1@ger.gmane.org>
	<20090303021719.GK26343@smtp.west.cox.net>
	<49ACC60F.9050808@tait.co.nz>
Date: Tue, 3 Mar 2009 09:14:37 +0100
Message-ID: <74d0deb30903030014q204a976do696203ec4bab7feb@mail.gmail.com>
From: pHilipp Zabel <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: fatal: Not a git repository
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
X-List-Received-Date: Tue, 03 Mar 2009 08:19:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2009 at 6:54 AM, Douglas Royds <douglas.royds@tait.co.nz> wr=
ote:
> Tom Rini wrote:
>>
>> On Tue, Mar 03, 2009 at 12:12:38AM +0000, Vitus Jensen wrote:
>>
>>>
>>> Am Mon, 02 Mar 2009 16:55:54 +1300 schrieb Douglas Royds:
>>>
>>>>
>>>> Anyone else getting this?
>>>>
>>>> =A0 =A0NOTE: Handling BitBake files: / (6587/6587) [100 %] NOTE: Parsi=
ng
>>>> =A0 =A0finished. 6302 cached, 0 parsed, 285 skipped, 0 masked. NOTE: C=
ache
>>>> =A0 =A0is clean, not saving.
>>>> =A0 =A0NOTE: build 200903021645: started
>>>> =A0 =A0fatal: Not a git repository <----------------------
>>>>
>>>> =A0 =A0OE Build Configuration:
>>>> =A0 =A0BB_VERSION =A0 =A0 =A0 =A0=3D "1.8.12"
>>>> =A0 =A0...
>>>>
>>>
>>> Yes, it happens on every build. =A0I guess bitbake is testing the curre=
nt
>>> directory via git and would include the current head in the build numbe=
r.
>>>
>>>
>>>>
>>>> The same complaint seems to crop up at various points during a build, =
as
>>>> well.
>>>>
>>>> Suggestions?
>>>>
>>>
>>> Just ignore. =A0Besides called "fatal" it isn't fatal at all.
>>>
>>
>> Well, to git it's fatal :) =A0Someone should dig to where the call is an=
d
>> redirect stderr somewhere, I suspect..
>>
>
> This silences it, though I'm not sure that it's the right solution:
>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 18afc1a..21b08a5 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -807,7 +807,7 @@ def base_get_metadata_svn_revision(d):
>
> def base_get_metadata_git_branch(d):
> =A0 =A0 =A0 import os
> - =A0 =A0 =A0 branch =3D os.popen('cd %s; git branch | grep "^* " | tr -d=
 "* "' %
> base_get_scmbasepath(d)).read()
> + =A0 =A0 =A0 branch =3D os.popen('cd %s; git branch 2>&1 | grep "^* " | =
tr -d "* "'
> % base_get_scmbasepath(d)).read()
>
> =A0 =A0 =A0 if len(branch) !=3D 0:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return branch

Maybe it should test whether
os.path.join(base_get_scmbasepath(d),'.git') exists before calling out
to git?

regards
Philipp


