Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32768.1793879744255852425
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Q4lVJK6C;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so10792025e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 03:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793879742; x=1794484542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T8nIzOVBzctTIPgZnG05K/iJEJYLDmX6VT2r5yEEN9g=;
        b=Q4lVJK6CIvG43SI1zfbE2wOcy5Z9thMC1ZyMhkV0ucqRrV9x/nPk2f1RYSvFDLcKOr
         BF4TqyOLCQvgyLneXms+y2ddcRNJxTCyH3O8Zz/twC4/CyzOYhxi9/kgsPRobS95MGxZ
         Eyvs6GOeRMCbqSpD0r5fQZ+6Z+7sKLM6bKCrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879742; x=1794484542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T8nIzOVBzctTIPgZnG05K/iJEJYLDmX6VT2r5yEEN9g=;
        b=QhgD4sTX/joxQpPpdkBMQNJ4jGVDHLJA1vBwfGIiv5pc3rTyYv5qW6elxMgZ4kvmeb
         CBrG7NhcW3Wh7DphY+zUCu/RIHMUkTt833zSWr+m6nY1pEmLdFkyBsNXwqFgmhX15/78
         pezu+7BE7Wi+FT9gwtJyEEW55ZCEhh0PdKqinKqFDFoEN/u1X69Rla3QhxF9Af3a6UMj
         hCqfIQHaKhhkjM5Ym3QotexcanHXm7y38+7l2ZgptA3Ol8RS0DPSa1Um3XxvKNQ6J0eQ
         lWkwdLtUOFWaCPGAXlBJ2zl7gDhbkhDh9xz5BajCD+WOEhwWusyFQVnargUpVR4AmE6I
         ttvw==
X-Gm-Message-State: APuU4Z8O7Ee00dGHo1ISy1CYDqp1vnZ6biI3+/DT1S7cscx49DRvcGox
	6Ito5owNZt1pb9KraOx5XOWXSj4XUjDiOHaortffs6vAM3dvSEnA8qen4rARcS2Vfsjc2C4LMw8
	82i76
X-Gm-Gg: AYBFou2o/OnEPlFLZu/lXrUGEKExGjDjj7i6o/X3uvOKxgqF1kl9vG8CVRmn7XMLdNR
	qB4ZjJYwtN1g2h7WIgH+fRyrm9chhQJ5vNEwararOegaxzmWJgp7Lqp/VIKW5xbYWQV3I9Qz/mE
	8PXdAUJtOdj7NJwQpU4v5p+CcMP1OOd0Yx4giismQIyK48zH/bOF5FYEORxG8c4HB2d04AWHYSw
	+ivuv6lX1tUrOmsFSwNe3KBjHKvuwlTMu0NLyYbKe2f0WMti0zUAmDL9Ol38U8IQsjwSl6JgNwy
	LaArQXmmpruEZLcjG/wVaMv3Rsihhsi4x0NHZ5zVckBdE/SbZ1EErZDktcgW9sF/KPdKtO2kcU9
	bs11NgkeTRXhtutAehW/Ry6xEInQ1LF33Qvdz842S4fJ+H/tsDaN/E56PR/HQjTqqrflf6kgDLi
	gKci4IPiMG2OiM6b7RCH7eaIAgTiNp1jY2hIf+TBJbRGV13uaMVfpfhhX+tdq87SF03iGMmOfDq
	BZl7gBPf4E8Uph6//yEM4/LG7Q/OxaG+8XvV/iE2PG5eCl+p0NfG247WYJaNfwhrdsCyQy382na
	Wsi1KRNcg03iJTXFYXZA/6QRENLthq4GhCWPFuwPK8eVqGHXdQaAn/112cjXO3r1NxBV+KnDlGD
	DwrzSDAy2W6raZvLRA5pKNvLUeL6Mi38sDSJmSDWcAtA3wmsIAVYkoA==
X-Received: by 2002:a05:600c:818e:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4ac1932aa2amr403178885e9.34.1793879742389;
        Thu, 05 Nov 2026 03:55:42 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm173720995e9.3.2026.11.05.03.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:55:41 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 15/19] python3-soupsieve: Upgrade 3.0.4 -> 4.0
Date: Thu,  5 Nov 2026 13:55:22 +0200
Message-ID: <20261105115526.634289-15-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105115526.634289-1-leon.anavi@konsulko.com>
References: <20261105115526.634289-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 11:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131915
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.0:

- BREAK: The contents of an HTML template are no longer treated as
  part of the document. Selectors do not descend into a template,
  and elements inside one can't see beyond it, which also applies
  to pseudo-classes such as :lang(), :disabled, and :default.
  select and filter will still reach the contents of a template
  when they are called on the template itself, for example
  soup.template.select('p'). See the FAQ for more information.
- BREAK: The contents of an iframe are no longer treated as a
  separate document, as they are not one in a browser. Elements in
  an iframe are normal children, so :root does not match them, and
  :default, :indeterminate, :checked, :dir(), :lang(), and
  :read-write treat them like any other element. Recent versions of
  html.parser, lxml, and html5lib all escape the contents of an
  iframe like a browser does, so this mostly affects XHTML, Python
  versions that still don't escape such content in their specific
  html.parser, and elements added to an iframe by hand.
  :-soup-contains() now also includes the escaped text in an
  iframe. See the FAQ for more information.
- NEW: Update :disabled and :enabled to treat option and optgroup
  elements inside a disabled select as disabled, following a recent
  HTML specification update.
- FIX: Fix the subsequent-sibling combinator and :has(~ ...) never
  matching top level elements of a fragment that has no root
  element, unless caching was disabled.
- FIX: :indeterminate now treats a radio button group without a
  form as extending across the whole document instead of the top
  level element that contains it, and it no longer ignores radio
  buttons at the top level.
- FIX: Fix :default to treat a button with a missing or invalid
  type, and an input with type="image", as submit buttons.
- FIX: Fix :in-range and :out-of-range raising TypeError when the
  document contains an input without a type attribute.
- FIX: :read-write (and :read-only) now treat
  contenteditable="plaintext-only" elements as editing hosts and
  match the editable elements inside an editing host, following the
  nearest contenteditable state.
- FIX: :read-write (and :read-only) now ignore contenteditable on
  non-HTML elements, such as an SVG foreignObject, as the attribute
  only applies to HTML elements. Such elements inherit the state of
  their parent.
- FIX: :checked now only matches the last radio button with a
  checked attribute in a radio button group, as in a browser, where
  a group is the radio buttons with the same name and form,
  including the form attribute. :default still matches all of them,
  and the contents of a template are unaffected as they are not
  connected.
- FIX: :dir() and :defined no longer affect the rest of the
  selector list they are in. Previously, a selector list that used
  either of them could not have its combinators cross an iframe,
  ignored the specified namespaces, and matched nothing in XML, not
  even the parts that didn't use them. They still do not match in
  XML, but :not(:dir(ltr)) and :not(:defined) now do.
- FIX: :default and :indeterminate now honor the form attribute,
  which can associate a submit button or radio button with a form
  it is not in, or leave it without a form. It is ignored in a
  template, as in the HTML specification. Submit buttons outside of
  a form can now be its default button.
- FIX: :default, :checked, and :indeterminate now handle a form
  inside a form like a browser. In HTML, a browser ignores the
  nested form and takes its end tag for that of the parent, which
  matters for parsers that keep the nested form, such as
  html.parser. In XHTML and in a template, nested forms are real
  forms.
- FIX: :checked now matches the option that a browser would select.
  Without multiple, that is only the last option with a selected
  attribute in a select, and if there are none and the select shows
  a single option, the first option that is not disabled. :default
  still only considers the selected attribute.
- FIX: Fix [attribute!=value] excluding values that only start with
  the specified value, and in XML documents, type values that
  contain a newline.
- FIX: Match the values of every attribute that the HTML
  specification lists as ASCII case insensitive (rel, method, lang,
  dir, ...) without ASCII case sensitivity on HTML elements in HTML
  documents, not just type. Non-HTML elements are matched case
  sensitively.
- FIX: :dir() now matches non-HTML elements, such as SVG and
  MathML, by the direction they inherit from their parent (the dir
  attribute only applies to HTML elements), and HTML elements
  inside them, such as in an SVG foreignObject, by the direction of
  their ancestors.
- FIX: Fix :dir() ignoring the value of an input with dir="auto"
  and a missing or empty type.
- FIX: :dir() now uses a table generated from Unicode 18 instead of
  unicodedata, so results no longer depend on the Unicode version
  of the Python in use, and unassigned code points use their
  default direction.
- FIX: :dir() now uses the value of an input with dir="auto" when
  type is hidden, password, submit, reset, or button, as the HTML
  specification does.
- FIX: dir="auto" and bdi now analyze the text of non-HTML
  elements, such as SVG and MathML, and only ignore HTML elements
  such as script, style, and bdi. The text directly in an iframe is
  analyzed as well, and the contents of a template, which are not
  part of the document, are not.
- FIX: :dir() no longer lets the contents of a template inherit
  direction from the template or its ancestors, as they are not
  part of the document. They are left to right unless they specify
  otherwise.
- FIX: :dir() now matches a bdi element that is the root by its
  text instead of assuming left to right.
- FIX: :dir() now treats any element without a parent element as
  left to right, not just the root. Before, all but the first top
  level element of a fragment parsed with html.parser never
  matched.
- FIX: :dir() now accepts any identifier, as CSS requires,
  including escaped ones. Values other than ltr and rtl do not
  match anything.
- FIX: Respect namespaces provided by the parser when the root is
  not an HTML element, such as an svg element extracted from an
  html5lib document. Previously every element in such a tree was
  treated as an HTML element, which affected namespace selectors,
  namespaced attributes, and HTML specific pseudo-classes.
- FIX: Fix :lang() treating an element with an empty lang or
  xml:lang attribute as having the language of a tagged ancestor.
- FIX: Cache forms without a default button when matching :default
  to avoid quadratic time on forms with many non-default submit
  candidates.
- FIX: Fix :in-range and :out-of-range matching elements whose
  value, min, or max has a trailing newline; per HTML, such values
  are not valid, so they are treated like a missing value and
  cannot be out of range.
- FIX: Fix :in-range and :out-of-range raising ValueError when a
  date, month, week, or local date and time input has a year with
  more digits than Python will convert; such a year is now treated
  as invalid.
- FIX: Fix :in-range and :out-of-range not recognizing a
  datetime-local value, min, or max that uses a single space
  instead of T to separate the date and time.
- FIX: Search a form only once for checked radio buttons when
  matching :indeterminate to avoid quadratic time on forms with
  many radio button groups.
- FIX: :lang() now uses the lang attribute of SVG elements, as the
  HTML specification does (with xml:lang taking precedence).
  Previously only xml:lang was considered for elements outside the
  HTML namespace.
- FIX: :defined no longer matches HTML elements with an is
  attribute (customized built-in elements), which, like custom
  elements, are undefined until they are registered.
- FIX: Cache the index of each child when matching the general
  sibling combinator (a ~ b and :has(~ b)) to avoid quadratic time
  when the first matching sibling is far into a long list of
  siblings.
- FIX: Match attribute values with the i modifier using ASCII case
  insensitivity.
- FIX: Treat an input with an unknown type, such as type="foo", as
  a text input in :placeholder-shown, :read-write, :read-only and
  :dir(), as an invalid type is in the Text state in the HTML
  specification.
- FIX: Fix :enabled and :disabled never matching input elements
  with type="hidden".
- FIX: :required no longer matches input elements of types the
  required attribute does not apply to (hidden, range, color,
  submit, image, reset and button). Like in browsers, they match
  :optional.
- FIX: Cache whether an element is or has a matching ancestor when
  matching the descendant combinator (a b) to avoid time that grows
  with the depth of the document to the power of the number of
  combinators.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-soupsieve_3.0.4.bb => python3-soupsieve_4.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_3.0.4.bb => python3-soupsieve_4.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_3.0.4.bb b/meta-python/recipes-devtools/python/python3-soupsieve_4.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-soupsieve_3.0.4.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_4.0.bb
index 8175ba94df..4ada8e4237 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_3.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_4.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=74851a2f1e5c07496dcb452af6a6bf54"
 
-SRC_URI[sha256sum] = "924fab84ae21604c19e175e1f39815eb6fa83ba23836e09e9de180925e5bc4c0"
+SRC_URI[sha256sum] = "ccd6470b256394ac44b08b86fd94b30a17d335a5335c8a3d15565f7b03d3c8cf"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.3

