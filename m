Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q5NEd-0001qm-T0 for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 21:08:47 +0200
Received: from f053040238.adsl.alicedsl.de ([78.53.40.238]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q5NCj-0007kI-Db for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 19:06:49 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D94C075.3020001@windriver.com>
References: <4D94C075.3020001@windriver.com>
Date: Thu, 31 Mar 2011 21:06:47 +0200
Message-ID: <1301598407.3988.15.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: Commit and Patch message guidelines - third draft.
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
X-List-Received-Date: Thu, 31 Mar 2011 19:08:48 -0000
X-Groupsio-MsgNum: 30787
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Ar2oco79ChIUF0g+DB7l"

--=-Ar2oco79ChIUF0g+DB7l
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Mark,


Am Donnerstag, den 31.03.2011, 12:57 -0500 schrieb Mark Hatle:
> This is the third draft of the guidelines... All previous feedback has be=
en
> incorporated...
>=20
> It is the first of the drafts being sent to the OpenEmbedded-devel mailin=
g list
> for comments.  The intention of the TSC is to use the following guideline=
s to
> help increase the quality of the commit and patches within Open Embedded.

No space in OpenEmbedded. ;-)

> Please review the following guidelines and let me know if you have any
> questions, comments or concerns with them.
>=20
> ----
>=20
> This set of guidelines is intended to help both the developer and reviewe=
rs of
> changes determine reasonable patch and change commit messages. Often when
> working with the code, you forget that not everyone is as familiar with t=
he
> problem and/or fix as you are. Often the next person in the code doesn't
> understand what or why something is done so they quickly look at patch an=
d
> commit messages. Unless these messages are clear it will be difficult to
> understand the relevance of a given change and how future changes may imp=
act
> previous decisions.
>=20
> Both patches and commit messages require the same attention and basic det=
ails,
> however the purposes of the messages are slightly different. A patch need=
s to
> describe a specific change that fixes an individual problem in a componen=
t,

Excuse my ignorance and please keep in mind that English is not my
native language. I do not get that sentence. How can a patch describe
something.

Reading further down, I now get in what context you use patch here.
Maybe you should make clear in the beginning that you mean patches which
gets applied by the recipe and not patches to be submitted directly to
OpenEmbedded. (That is still ambiguous.)

> while a commit message describes one or more changes to the overall proje=
ct or
> system.
>=20
> By following these guidelines we will have a better record of the problem=
s and
> solutions made over the course of development. It will also help establis=
h a
> clear provenance of all of the code and changes within the development.
>=20
> General Information
> -------------------
>=20
> While specific to the Linux kernel development, the following could also =
be
> considered a general guide for any Open Source development:
>=20
> http://ldn.linuxfoundation.org/book/how-participate-linux-community
>=20
> Many of the guidelines in this document are related to the items in that
> information.
>=20
> Pay particular attention to section 5.3 that talks about patch preparatio=
n.
> They key thing to remember is to break up your changes into logical secti=
ons.

s/They/The/

> Otherwise you run the risk of not being able to even explain the purpose =
of a
> change in the patch headers!
>=20
> Patch and Commit Headers
> ------------------------
> There seems to always be a question or two surrounding what a person
> should put in a patch header, or commit message.
>=20
> The general rules always apply, those being that there is a single line
> short log or summary of the change (think of this as the subject when the=
 patch
> is e-mailed), and then the more detailed long log, and closure with tag l=
ines
> like the "Signed-off-by:" or "Integrated-by:"
>=20
> See the examples below for examples and details.
>=20
> New development
> ---------------
>=20
> A minimal patch or commit message would be of the format:
>=20
>    Short log / Statement of what needed to be changed.

1. I think that line is also named =C2=BBcommit summary=C2=AB in Git terms.
2. Do we suggest a maximum line length for the short log?

>    (Optional pointers to external resources, such as defect tracking)
>=20
>    The intent of your change.
>=20
>    (Optional, if it's not clear from above) how your change resolves the
>    issues in the first part.
>=20
>    Tag line(s) at the end.
>=20
> For example:
>=20
>    foobar: Adjusted the foo setting in bar
>=20
>    When using foobar on systems with less than a gigabyte of RAM common
>    usage patterns often result in an Out-of-memory condition causing
>    slowdowns and unexpected application termination.
>=20
>    Low-memory systems should continue to function without running into
>    memory-starvation conditions with minimal cost to systems with more
>    available memory.  High-memory systems will be less able to use the
>    full extent of the system, a dynamically tunable option may be best,
>    long-term.
>=20
>    The foo setting in bar was decreased from X to X-50% in order to
>    ensure we don't exhaust all system memory with foobar threads.
>=20
>    Signed-off-by: Joe Developer <joe.developer@example.com>
>=20
> The minimal commit is good for new code development and simple changes.
>=20
> The single short log message indicates what needed to be changed. It shou=
ld
> begin with an indicator as to the primary item changed by this patch,
> followed by a short summary of the change. In the above case we're indica=
ting
> that we've changed the "foobar" item, by "adjusting the foo setting in ba=
r".
>=20
> Optionally, you may include pointers to defects this change corrects. Unl=
ess
> the defect format is specified by the component you are modifying, it is
> suggested that you use a full URL to specify the reference to the defect
> information.

Example.

> You must then have a full description of the change. Specifying the inten=
t of
> your change and if necessary how the change resolves the issue.
>=20
> As mentioned above this is intended to answer the "what were you thinking=
"
> questions down the road and to know what other impacts are likely to
> result of the change needs to be reverted. It also allows for better
> solutions if someone comes along later and agrees with paragraph 1
> (the problem statement) and either disagrees with paragraph 2
> (the design) or paragraph 3 (the implementation).
>=20
> Finally one or more tag lines should exist. Each developer responsible
> for working on the patch is responsible for adding a Signed-off-by: tag l=
ine.
>=20
> It is not acceptable to have an empty or non-existent header, or just a s=
ingle
> line message. The summary and description is required for all changes.
>=20
> Importing from elsewhere
> -----------------------------
> If you are importing work from somewhere else, the minimum commit message=
 is not
> enough. It does not clearly establish the provenance of the code. The fol=
lowing
> specified the guidelines required for importing code from elsewhere.
>=20
> By default you should keep the original authors summary and commit messag=
e,
> along with any Signed-off-by: information. If the original change that wa=
s
> imported does not have a summary and/or commit message from the original =
author,
> it is still your responsibility to add them to the patch. Just as if you =
wrote
> the code, you should be able to clearly explain what the change does. It =
is also
> necessary to document the original author of the change. You should indic=
ate the
> original author by simply stating "written by" or "posted to the ... mail=
ing
> list by". Only the original author can commit using a Signed-off-by: tag =
line.
>=20
> It is also required that the origin of the work be fully documented. The =
origin
> should be specified as part of the commit message in a way that an averag=
e
> developer would be able to track down the original code. URLs should refe=
rence
> original authoritative sources and not mirrors.
>=20
> If changes were required to the patch, they should be documented as well.

Is a tag line also needed then? What kind of tag line?

> Finally a tag line should be added to indicate that you worked with the p=
atch.
> The "Integrated-by:" tag line should be used to indicate that you did not=
 need
> to modify the patch, it was integrated unchanged. The "Signed-off-by:" ta=
g line
> should only be used when changes to the original patch were necessary.

Are the tag lines also needed in the patch?

> For example, if you were to pull in the patch from the above example unmo=
dified:
>=20
>    foobar: Adjusted the foo setting in bar
>=20
>    When using foobar on systems with less than a gigabyte of RAM common
>    usage patterns often result in an Out-of-memory condition causing
>    slowdowns and unexpected application termination.
>=20
>    Low-memory systems should continue to function without running into
>    memory-starvation conditions with minimal cost to systems with more
>    available memory.  High-memory systems will be less able to use the
>    full extent of the system, a dynamically tunable option may be best,
>    long-term.
>=20
>    The foo setting in bar was decreased from X to X-50% in order to
>    ensure we don't exhaust all system memory with foobar threads.
>=20
>    Signed-off-by: Joe Developer <joe.developer@example.com>
>=20
>    The foobar recipe was imported from the OpenEmbedded git server
>    (git://git.openembedded.org/openembedded) as of commit id
>    b65a0e0c84cf489bfa00d6aa6c48abc5a237100f.
>=20
>    Integrated-by: Your Name <your.name@openembedded.org>
>=20
> The above example shows a clear way for a developer to find the original =
source
> of the change. It indicates that the open embedded

s/open embedded/OpenEmbedded/

> developer simply integrated
> the change into the system without making any further modifications.
>=20
> However in the same example, if the author did have to make some changes =
to the
> original patch it would look like this:
>=20
>    foobar: Adjusted the foo setting in bar
>=20
>    When using foobar on systems with less than a gigabyte of RAM common
>    usage patterns often result in an Out-of-memory condition causing
>    slowdowns and unexpected application termination.
>=20
>    Low-memory systems should continue to function without running into
>    memory-starvation conditions with minimal cost to systems with more
>    available memory.  High-memory systems will be less able to use the
>    full extent of the system, a dynamically tunable option may be best,
>    long-term.
>=20
>    The foo setting in bar was decreased from X to X-50% in order to
>    ensure we don't exhaust all system memory with foobar threads.
>=20
>    Signed-off-by: Joe Developer <joe.developer@example.com>
>=20
>    The foobar recipe was imported from the OpenEmbedded git server
>    (git://git.openembedded.org/openembedded) as of commit id
>    b65a0e0c84cf489bfa00d6aa6c48abc5a237100f.
>=20
>    It was necessary to change the memory threshold from 50% to 42%
>    due to the constraints of the implementation of bar in OpenEmbedded.
>=20
>    Signed-off-by: Your Name <your.name@openembedded.org>
>=20
>=20
> Common Errors in Patch and Commit messages
> ------------------------------------------
>=20
> - Don't have one huge patch, split your change into logical subparts. It'=
s
> easier to track down problems afterwards with a binary search

Mention `git bisect`?

> and also people can then cherrypick

s/cherrypick/cherry pick/?

> changes into things like stable branches.
>=20
> - Don't simply translate your change into English for a commit log. The l=
og
> "Change compare from zero to one" is bad because it describes only the co=
de
> change in the patch; we can see that from reading the patch itself. Let t=
he code
> tell the story of the mechanics of the change (as much as possible), and =
let
> your comment tell the other details -- i.e. what the problem was, how it
> manifested itself (symptoms), and if necessary, the justification for why=
 the
> fix was done in manner that it was.
>=20
> - Don't start your commit log with "This patch..." -- we already know it =
is a patch.
>=20
> - Don't repeat your short log in the long log. If you really really don't=
 have
> anything new and informational to add in as a long log, then don't put a =
long
> log at all. This should be uncommon -- i.e. the only acceptable cases for=
 no
> long log would be something like "Fix spelling mistakes in Documentation/=
README"
> or similar.

A common case is also when updating/adding program versions.

	foo: add version 10.=CE=BC.=CE=B2.=CF=80

> - Don't put absolute paths to source files that are specific to your site=
, i.e.
> if you get a compile error on "fs/exec.c" then tidy up the parts of the c=
ompile
> output to just show that portion. We don't need to see that it was
> /home/wally/src/git/oe-core/meta/classes/insane.bbclass or similar - that=
 full
> path has no value to others.

How much should it be stripped?

> - Always use the most significant ramification of the change in the words=
 of
> your subject/shortlog. For example, don't say "fix compile warning in foo=
" when
> the compiler warning was really telling us that we were dereferencing com=
plete
> garbage off in the weeds that could in theory cause an OOPS under some
> circumstances. When people are choosing commits for backports to stable o=
r
> distro kernels, the shortlog will be what they use for an initial sorting
> selection. If they see "Fix possible OOPS in...." then these people will =
look
> closer, whereas they most likely will skip over simple warning fixes.
>=20
> - Don't put in the full 20 or more lines of a backtrace when really it is=
 just
> the last 5 or so function calls that are relevant to the crash/fix. If th=
e entry
> point, or start of the trace is relevant (i.e. a syscall or similar), you=
 can
> leave that, and then replace a chunk of the intermediate calls in the mid=
dle
> with a single [...]

I have to remember that. ;-)

> - Don't include timestamps or other unnecessary information, unless they =
are
> relevant to the situation (i.e. indicating an unacceptable delay in a dri=
ver
> initialization etc.)
>=20
> - Don't use links to temporary resources like pastebin and friends. The c=
ommit
> message may be read long after this resource timed out.
>=20
> - Don't reference mirrors, but instead always reference original authorit=
ative
> sources.
>=20
> - Avoid punctuation in the short log.

I would then also propose to *not* start with a capital letter.

In OpenEmbedded it is common to write the recipe name (and if necessary
the version) in front of the commit summary. I kind of liked that rule.

Thank you for the write up/proposal. All in all it is quite long. Maybe
a summary/short version/example should be put right at the beginning.


Thanks,

Paul

--=-Ar2oco79ChIUF0g+DB7l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2U0MAACgkQPX1aK2wOHVhLdwCdEmGG8XA05FQwaVzOX8nZIoRz
oe4An2raaRk1M6Ven+67s+4osOfpbn9h
=y7/A
-----END PGP SIGNATURE-----

--=-Ar2oco79ChIUF0g+DB7l--
