Return-Path: <pandey_himanshu80@rediffmail.com>
Received: from f4mail-83-119.rediffmail.com (Webmail67.rediffmail.com
	[203.199.83.119])
	by mail.openembedded.org (Postfix) with ESMTP id E93ED7382E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 13:49:02 +0000 (UTC)
Received: from rediffmail.com (unknown [10.50.250.70])
	by f4mail-83-119.rediffmail.com (Postfix) with SMTP id 5A9A33083557
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 18:21:14 +0530 (IST)
Received: (qmail 13885 invoked by uid 510); 2 Mar 2015 12:52:22 -0000
Comment: DomainKeys? See http://antispam.yahoo.com/domainkeys
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=redf; d=rediffmail.com;
	b=eSojK8y37FH0DHsJaXpf4dBr5WkgMhsl4OevpUBvCTwUFL2e7MBLhDSL5guRNv0di0ydYzNCfVtKo/TgxgLPfCRreoPy9Qd6HZmo5q7GtK34z/FPcKjPZugASxnT5AWtd+1nxqErQ0WoQb9z6sE+tCKp71umVKtM7/4sJlrDHOI=
	; 
x-m-msg: asd54ad564ad7aa6sd5as6d5; a6da7d6asas6dasd77; 5dad65ad5sd;
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: : 0
X-CTCH-RefID: str=0001.0A160206.54F45D04.006F, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-REDF-OSEN: pandey_himanshu80@rediffmail.com
Date: 2 Mar 2015 12:52:19 -0000
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Received: from unknown 103.25.205.2 by rediffmail.com via HTTP;
	02 Mar 2015 12:52:19 -0000
X-Senderscore: D=0&S=0
Message-ID: <1425284823.S.10346.18650.F.H.WU1hcnRpbiBKYW5zYQBSZTogW29lXSBbbWV0YS1vZV1bUEFUQ0ggMy83XSBsaWJnZWU6IFVwZGF0ZSB0byA_.RU.rfs315,
	rfs315, 418,
	340.f6-235-77.old.1425300739.12136@webmail.rediffmail.com>
Sender: pandey_himanshu80@rediffmail.com
From: "Himanshu  Pandey" <pandey_himanshu80@rediffmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Regarding RPM Packages
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
X-List-Received-Date: Mon, 02 Mar 2015 13:49:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,
I want to generate an image with following rpms:
readline-6.0-4.el6.x86_64acl-2.2.49-6.el6.x86_64iptables-1.4.7-5.1.el6_2.x86_64grep-2.6.3-3.el6.x86_64binutils-2.20.51.0.2-5.34.el6.x86_64rootfiles-8.1-6.1.el6.noarchopenssl-1.0.1e-16.el6_5.15.x86_64So somebody please guide me on how to proceed and achieve this.Regards,Himanshu



From: Martin Jansa &lt;martin.jansa@gmail.com&gt;
Sent: Mon, 02 Mar 2015 13:57:03 
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH 3/7] libgee: Update to Version 0.16.1
On Sun, Mar 01, 2015 at 02:57:29PM +0100, Sven Ebenfeld wrote:

&gt; Am 01.03.2015 um 07:19 schrieb Martin Jansa:

&gt; &gt; On Sat, Feb 21, 2015 at 10:52:11AM +0100, Sven Ebenfeld wrote:

&gt; &gt;&gt; ---

&gt; &gt;&gt; &nbsp;meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb | 10 ++++++++++

&gt; &gt;&gt; &nbsp;meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb &nbsp;| 10 ----------

&gt; &gt;&gt; &nbsp;2 files changed, 10 insertions(+), 10 deletions(-)

&gt; &gt;&gt; &nbsp;create mode 100644 meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb

&gt; &gt;&gt; &nbsp;delete mode 100644 meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb

&gt; &gt; 

&gt; &gt; be aware that this change breaks some components, because libgee's

&gt; &gt; pkgconfig file was renamed from gee-1.0 to gee-0.8 in

&gt; &gt; https://github.com/GNOME/libgee/commit/e6fc195b449f1462bd6eea962799b814ad2c519b

&gt; &gt; 

&gt; 

&gt; You are right, the website of libgee states incompatibility between

&gt; these two versions. But I've only found two recipes in oe-core and

&gt; meta-openembedded, that had libgee as dependency.

&gt; 

&gt; Vala-Dbus-binding-tool in version 0.4.1 required the newer libgee

&gt; version. The other recipe (sry, I don't remember which one it was)

&gt; compiled well even with the change to the newer version.

&gt; 

&gt; If there are recipe that can't be switchted to the newer version of

&gt; libgee, I think we should rename the recipes to libgee0.6_0.6.4 and

&gt; libgee0.8_0.16.1.



freesmartphone is heavily using libgee+vala and libfsoframework was

failing in world build.



There is wip branch for libgee 0.8 compatibility, but not enough to fix

the do_compile issue (fixes only configuration).



https://github.com/freesmartphone/cornucopia/tree/wip/gee-0.8



-- 

Martin 'JaMa' Jansa &nbsp; &nbsp; jabber: Martin.Jansa@gmail.com

-- 

_______________________________________________

Openembedded-devel mailing list

Openembedded-devel@lists.openembedded.org

http://lists.openembedded.org/mailman/listinfo/openembedded-devel


