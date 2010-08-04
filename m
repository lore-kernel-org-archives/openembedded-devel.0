Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OgcXv-0001hZ-2d
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 13:54:09 +0200
Received: by bwz10 with SMTP id 10so2769096bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 04:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=o3VCgfqPzV62AT9p0Ctxjiubs6LbM4FQ6N8Yke1Opo0=;
	b=Azd7y+9YF1rV1lfgAgO0ezWJ5GTB9bjaZarpcJpuPMZlxpBCL1OPiNmHvnc1AU3dTa
	/qN6R7uwG9eRJgYM9Q6Asew2JS9gOHAliJBnuKwUN+gkKhdjrpTTr0lLjYOp8s3AWlj9
	3jqaiNiayICKdSKESEzMhlwr3z4udIopdDaAg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=jG6aI/ngHzdVy349NAvzRRYmYkKUwtdhuhFrwnBPSLwoWlub+mVCz0ceVHApJCbGHd
	WJ3uz9hZCAmX79YcaXwqZ5ZXiWI4KOzqZ8GkO90ew264WaBlhW4NdqShL5i5+HcQKPfT
	oBJV4aGxicpp/L2wCylRUQYgXi4FFhT6ycJZs=
MIME-Version: 1.0
Received: by 10.204.180.75 with SMTP id bt11mr6205964bkb.115.1280922843734; 
	Wed, 04 Aug 2010 04:54:03 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Wed, 4 Aug 2010 04:54:03 -0700 (PDT)
In-Reply-To: <1280918590-5969-3-git-send-email-henri.bragge@dcombus.com>
References: <1280918590-5969-1-git-send-email-henri.bragge@dcombus.com>
	<1280918590-5969-2-git-send-email-henri.bragge@dcombus.com>
	<1280918590-5969-3-git-send-email-henri.bragge@dcombus.com>
Date: Wed, 4 Aug 2010 13:54:03 +0200
Message-ID: <AANLkTik=Xm39yJcLnLH12heRyvS0gUEvSwFCJMBtWeLi@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 2/2] recipe for scli-0.4.0
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
X-List-Received-Date: Wed, 04 Aug 2010 11:54:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/4 Henri Bragge <henri.bragge@dcombus.com>

> Signed-off-by: Henri Bragge <henri.bragge@dcombus.com>
> ---
>  recipes/scli/scli.inc    |    6 ++++++
>  recipes/scli/scli_svn.bb |    8 ++++++++
>  2 files changed, 14 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/scli/scli.inc
>  create mode 100644 recipes/scli/scli_svn.bb
>
> diff --git a/recipes/scli/scli.inc b/recipes/scli/scli.inc
> new file mode 100644
> index 0000000..abe341d
> --- /dev/null
> +++ b/recipes/scli/scli.inc
> @@ -0,0 +1,6 @@
> +DESCRIPTION = "SNMP Command Line Interface"
> +LICENSE = "GPLv2"
> +SECTION = "console/network"
> +DEPENDS = "gsnmp readline libxml2 ncurses"
> +
> +inherit autotools
> diff --git a/recipes/scli/scli_svn.bb b/recipes/scli/scli_svn.bb
> new file mode 100644
> index 0000000..45bd08e
> --- /dev/null
> +++ b/recipes/scli/scli_svn.bb
> @@ -0,0 +1,8 @@
> +require scli.inc
> +
> +SRCREV = "3285"
> +PV = "0.4.0+svnr${SRCREV}"
> +PR = "r1"
>
+
> +SRC_URI = "svn://
> cnds.eecs.jacobs-university.de/svn/schoenw/src/scli;module=trunk;proto=https
> "
> +S = "${WORKDIR}/trunk"
>

Same remarks as for the other one.
Also, do we need the .inc file. If I look at the content it is hardly worth
putting it in a separate file.

Then again *if* you insist on an inc file you should also have an INC_PR.

This also holds for the other recipe.

Frans

> --
> 1.5.6.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

