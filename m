Return-Path: <switesh.fulpagare@mindastoneridge.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7C3C371490
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Sep 2014 11:08:27 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id le20so767409vcb.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Sep 2014 04:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=vGLWWYEkh0YXcUkSac3/nnaW949QHA+mJ4g1q6chMYk=;
	b=RFq+a6Uht/8XwSsN/CXZ4pPlgAPOq0l3p7hlXiZpc6F4zcFlOa/XJj1VUVemI5j2T+
	w/GbruMsUWkVHPEAz6KtkgxGlndyd+5ZaFHAJTVzi2Hivk4I49YifqL5w2FEp1YLur/P
	XiA+l4q4z51FPCaKwytnghkOfarUadtmf9x5QV8dKT0bxG5Cz0TEb9RC1FGlvzSguQ8+
	T03zv7gD5kinYoeiIeQFeMrGeQDg5/Qz/aRZiKFvjbfVESTfMdugwmc+9iCLoTvm1Iee
	7tmzQsY6eDO+YjW64MZu2DrgCDwbucTrkaEJUp6scTEVmh3JHAgYRpJL+cLmecdeGGGs
	FEnA==
X-Gm-Message-State: ALoCoQk5HG0wsTz+9pCy6wVZqA26XZ7FdCiyLdjChverdo/lrriHQCBTc/eM7r2jRD5SM8KuGPrOP57qkvLBE7lsGSWEysmg9y1WvT9860ZQ4TASTwp6mKMtSHE/e/oGLRpez3s2QGTqUcsraxdQY1NnccAwndOlMw==
MIME-Version: 1.0
X-Received: by 10.53.7.225 with SMTP id df1mr8218300vdd.9.1409915308403; Fri,
	05 Sep 2014 04:08:28 -0700 (PDT)
Received: by 10.52.245.73 with HTTP; Fri, 5 Sep 2014 04:08:28 -0700 (PDT)
In-Reply-To: <CALRGHr9ts28vt-JN2v4SPKjd7-btmWrqVd7G=_cfcv4bGD_z1g@mail.gmail.com>
References: <CALRGHr-x0HHMz8paVPVFxmoZ41zRGBZ4GmY3N35VKfYx57v6Lg@mail.gmail.com>
	<CAP9ODKqZyLwdSGVSResWqOsxTLfPMXhGbh9a1mZL16RTG8nPsQ@mail.gmail.com>
	<CALRGHr9ts28vt-JN2v4SPKjd7-btmWrqVd7G=_cfcv4bGD_z1g@mail.gmail.com>
Date: Fri, 5 Sep 2014 16:38:28 +0530
Message-ID: <CALRGHr_u5LULhoxx0NLYK6Uux4uZ5Kr7+ikOY-TKqMvDfUfYmg@mail.gmail.com>
From: Switesh Fulpagare <switesh.fulpagare@mindastoneridge.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Error while bitbake meta-toolchain-qt5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Sep 2014 11:08:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Otavio,
   Thanks for your reply.
I have applied the patch, now it is fetching qtwayland_git.bb but it is
giving error for do unpack as shown in below link and
qtwayland-native_git.bb is not going to fetch.


http://pastebin.com/dk2gFin0


On Fri, Sep 5, 2014 at 3:40 PM, Switesh Fulpagare <
switesh.fulpagare@mindastoneridge.com> wrote:

> Hi Otavio,
>    Thanks for your reply.
> I have applied the patch, now it is fetching qtwayland_git.bb but it is
> giving error as shown log file in below link.
>
> http://pastebin.com/mzqsp6Nh
>
>
> On Fri, Sep 5, 2014 at 12:06 AM, Otavio Salvador <otavio@ossystems.com.br=
>
> wrote:
>
>> On Thu, Sep 4, 2014 at 4:10 AM, Switesh Fulpagare
>> <switesh.fulpagare@mindastoneridge.com> wrote:
>> > Can you please look at this post? I think it is problem with 'git://
>> > qt.gitorious.org/qt/qtwayland.git
>>
>> I just sent a patch fixing it; please try it.
>>
>> --
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://code.ossystems.com.br
>> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

--=20
=E2=80=9CThe contents of this e-mail message and any attachments are confid=
ential=20
and are intended solely for addressee. The information may also be legally=
=20
privileged. This transmission is sent in trust, for the sole purpose of=20
delivery to the intended recipient. If you have received this transmission=
=20
in error, any use, reproduction or dissemination of this transmission is=20
strictly prohibited. If you are not the intended recipient, please=20
immediately notify the sender by reply e-mail or phone and delete this=20
message and its attachments, if any.=E2=80=9D

